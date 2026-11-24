#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "usage: $0 <plugin folder under integrations/chatgpt>" >&2
    exit 2
fi

root=$(cd "$(dirname "$0")/.." && pwd)
plugin=$root/integrations/chatgpt/$1
version=$(sed -n 's/^  "version": "\(.*\)",$/\1/p' "$plugin/plugin.json")
if [ -z "$version" ]; then
    echo "no version in $plugin/plugin.json" >&2
    exit 1
fi

mkdir -p "$root/dist"
archive=$root/dist/$1-$version.zip
(cd "$plugin" && zip -qr -X -FS "$archive" . -x '.*' -x '*/.*')
echo "$archive"
