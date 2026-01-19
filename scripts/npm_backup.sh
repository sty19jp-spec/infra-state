#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="/opt/backups/npm"
mkdir -p "$OUT_DIR"

tar czf "${OUT_DIR}/npm_data_$(date +%F).tar.gz" -C /opt/stacks/reverse-proxy data
tar czf "${OUT_DIR}/npm_letsencrypt_$(date +%F).tar.gz" -C /opt/stacks/reverse-proxy letsencrypt

ls -lh "$OUT_DIR"
