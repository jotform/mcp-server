#!/usr/bin/env python3
"""Validate with Claude Code and build a reproducible, self-contained pilot ZIP."""

import argparse
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import zipfile


ROOT = Path(__file__).resolve().parents[1]
PLUGIN = ROOT / "plugins" / "jotform"


def package(output_dir: Path) -> Path:
    claude = shutil.which("claude")
    if not claude:
        raise ValueError("Claude Code is required; install it before packaging.")
    subprocess.run([claude, "plugin", "validate", "--strict", str(PLUGIN)], check=True)
    subprocess.run([claude, "plugin", "validate", "--strict", str(ROOT)], check=True)
    manifest = json.loads((PLUGIN / ".claude-plugin" / "plugin.json").read_text())
    name, version = manifest["name"], manifest["version"]
    if name != "jotform" or not re.fullmatch(r"\d+\.\d+\.\d+", version):
        raise ValueError("Expected jotform and a three-part numeric version.")
    if (PLUGIN / "LICENSE").read_bytes() != (ROOT / "LICENSE").read_bytes():
        raise ValueError("The plugin must include the repository's MIT license.")
    files = []
    for path in sorted(PLUGIN.rglob("*")):
        if path.is_symlink():
            raise ValueError(f"Symlinks cannot be packaged: {path}")
        if path.name in {".DS_Store", "Thumbs.db", "desktop.ini", "__MACOSX"}:
            raise ValueError(f"Remove system files before packaging: {path}")
        if path.is_file():
            if path.suffix not in {".json", ".md"} and path.name != "LICENSE":
                raise ValueError(f"Unexpected pilot package file: {path}")
            if path.stat().st_size >= 256 * 1024:
                raise ValueError(f"Pilot package file is too large: {path}")
            files.append(path)
    output_dir = output_dir.resolve()
    if output_dir == PLUGIN or PLUGIN in output_dir.parents:
        raise ValueError("Write the archive outside the plugin directory.")
    output_dir.mkdir(parents=True, exist_ok=True)
    destination = output_dir / f"{name}-claude-{version}.zip"
    # Build completely before replacing a previous artifact.
    with tempfile.TemporaryDirectory(dir=output_dir) as temporary:
        archive = Path(temporary) / destination.name
        with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_DEFLATED) as bundle:
            for path in files:
                entry = zipfile.ZipInfo(f"{name}/{path.relative_to(PLUGIN).as_posix()}",
                                        date_time=(2026, 1, 1, 0, 0, 0))
                entry.compress_type = zipfile.ZIP_DEFLATED
                entry.external_attr = 0o100644 << 16
                bundle.writestr(entry, path.read_bytes())
        with zipfile.ZipFile(archive) as bundle:
            if bundle.testzip() is not None:
                raise ValueError("ZIP integrity check failed.")
            if f"{name}/.claude-plugin/plugin.json" not in bundle.namelist():
                raise ValueError("Manifest is missing from the ZIP root directory.")
            # Validate the actual exported files, not just the source checkout.
            bundle.extractall(Path(temporary) / "extracted")
        subprocess.run([claude, "plugin", "validate", "--strict",
                        str(Path(temporary) / "extracted" / name)], check=True)
        archive.replace(destination)
    print(f"Created {destination} ({len(files)} files)")
    return destination


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=ROOT / "dist")
    args = parser.parse_args()
    try:
        package(args.output_dir)
    except (ValueError, subprocess.CalledProcessError) as error:
        parser.exit(1, f"Packaging failed: {error}\n")
