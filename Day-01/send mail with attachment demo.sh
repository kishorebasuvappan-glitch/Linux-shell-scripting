#!/bin/bash
# available_updates_list.sh
# Lists ONLY what apt can install now — no CVEs, no Trivy backlog.
#
# Output: updates_<host>_<date>.csv
#   Package, CurrentVersion, AvailableVersion, Pocket
#
# Options:
#   --sep ';'   Use semicolon as the column separator (opens pre-split on
#               EU/German Excel, which defaults to ';'). Default is ','.
#   --bom       Prepend a UTF-8 BOM so Excel auto-detects the delimiter.
#
# Examples:
#   ./available_updates_list.sh
#   ./available_updates_list.sh --sep ';'
#   ./available_updates_list.sh --sep ';' --bom
set -u

SEP=","
BOM=0
while [ $# -gt 0 ]; do
  case "$1" in
    --sep) SEP="$2"; shift 2 ;;
    --bom) BOM=1; shift ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

DATE=$(date +%Y%m%d)
HOST=$(hostname -s)
OUT="updates_${HOST}_${DATE}.csv"

echo "[*] Refreshing apt metadata..."
sudo apt-get update >/dev/null 2>&1

# Optional UTF-8 BOM for Excel delimiter auto-detection
[ "$BOM" -eq 1 ] && printf '\xEF\xBB\xBF' > "$OUT" || : > "$OUT"

echo "Package${SEP}CurrentVersion${SEP}AvailableVersion${SEP}Pocket" >> "$OUT"

# Format: pkg/pocket newver arch [upgradable from: oldver]
apt list --upgradable 2>/dev/null | grep -v '^Listing' | while read -r line; do
  pkg=$(echo "$line"   | sed -E 's#/.*##')
  pocket=$(echo "$line"| sed -E 's#^[^/]+/##; s/ .*//; s/,/+/g')
  newver=$(echo "$line"| awk '{print $2}')
  oldver=$(echo "$line"| sed -E 's/.*upgradable from: ([^]]+)\].*/\1/')
  echo "${pkg}${SEP}${oldver}${SEP}${newver}${SEP}${pocket}"
done >> "$OUT"

echo ""
echo "[✓] Written $OUT ($(($(wc -l < "$OUT") - 1)) packages, separator '${SEP}')"
