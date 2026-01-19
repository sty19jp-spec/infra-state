#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="/opt/backups/snapshots/$(date +%F)"
mkdir -p "$OUT_DIR"

docker ps > "${OUT_DIR}/docker_ps.txt"
docker network ls > "${OUT_DIR}/docker_network_ls.txt"
docker inspect npm > "${OUT_DIR}/docker_inspect_npm.json"
ss -lntp > "${OUT_DIR}/ss_lntp.txt"

echo "Snapshot saved: $OUT_DIR"
ls -lh "$OUT_DIR"
