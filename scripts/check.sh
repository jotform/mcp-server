#!/usr/bin/env bash
set -euo pipefail

if [ $# -gt 1 ]; then
    echo "usage: $0 [base ref]" >&2
    exit 2
fi

root=$(cd "$(dirname "$0")/.." && pwd)

python3 - "$root" "${1:-}" <<'PY'
import json
import pathlib
import re
import subprocess
import sys

root, base = pathlib.Path(sys.argv[1]), sys.argv[2]
MANIFESTS = {'claude': '.claude-plugin/plugin.json', 'chatgpt': 'plugin.json'}
SERVERS = {'claude': '.mcp.json', 'chatgpt': 'mcp.json'}
CATALOGS = {'claude': '.claude-plugin/marketplace.json', 'chatgpt': '.agents/plugins/marketplace.json'}
errors = []


def load(path):
    try:
        return json.loads(path.read_text(encoding='utf-8'))
    except (OSError, ValueError) as error:
        errors.append(f'{path.relative_to(root)}: {error}')
        return {}


def git(*args):
    return subprocess.run(['git', '-C', str(root), *args], capture_output=True, encoding='utf-8')


for host, manifest in MANIFESTS.items():
    listed = {entry['name'] for entry in load(root / CATALOGS[host]).get('plugins', [])}
    folders = {folder.name for folder in (root / 'integrations' / host).iterdir() if folder.is_dir()}
    for name in sorted(listed ^ folders):
        errors.append(f'{CATALOGS[host]}: {name} must be both listed and a folder in integrations/{host}')
    for folder in sorted(folders):
        plugin = root / 'integrations' / host / folder
        path = (plugin / manifest).relative_to(root)
        data = load(plugin / manifest)
        if data.get('name') != folder:
            errors.append(f'{path}: name must be {folder}')
        if not re.fullmatch(r'\d+\.\d+\.\d+', str(data.get('version', ''))):
            errors.append(f'{path}: version must be MAJOR.MINOR.PATCH')
        if len(load(plugin / SERVERS[host]).get('mcpServers', {})) != 1:
            errors.append(f'{(plugin / SERVERS[host]).relative_to(root)}: a plugin has one MCP server')
        for skill in sorted(plugin.glob('skills/*/SKILL.md')):
            match = re.match(r'---\n(.*?)\n---\n', skill.read_text(encoding='utf-8'), re.S)
            front = match.group(1) if match else ''
            name = re.search(r'^name: *(.+)$', front, re.M)
            if name is None or name.group(1).strip() != skill.parent.name:
                errors.append(f'{skill.relative_to(root)}: name must be {skill.parent.name}')
            if re.search(r'^description: *\S', front, re.M) is None:
                errors.append(f'{skill.relative_to(root)}: description is missing')
            stamped = re.search(r'^metadata:\n  version: "[0-9a-f]+"$', front, re.M) is not None
            if stamped != (host == 'claude'):
                errors.append(f'{skill.relative_to(root)}: only Claude skills carry metadata.version; export the skill from the source')
        if base and git('diff', '--quiet', base, '--', str(plugin.relative_to(root))).returncode != 0:
            before = git('show', f'{base}:{path}')
            if before.returncode == 0 and json.loads(before.stdout).get('version') == data.get('version'):
                errors.append(f'{path}: the plugin changed, so its version must change too')

load(root / 'gemini-extension.json')
for error in errors:
    print(error, file=sys.stderr)
sys.exit(1 if errors else 0)
PY
