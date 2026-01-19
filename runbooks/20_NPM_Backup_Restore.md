# NPM（Nginx Proxy Manager）バックアップ/リストア

## バックアップ対象（VPS上）
- /opt/stacks/reverse-proxy/data
- /opt/stacks/reverse-proxy/letsencrypt

※ NPMの設定・DB・証明書関連がここに入る想定。

## バックアップ（SSH）
mkdir -p /opt/backups/npm
tar czf /opt/backups/npm/npm_data_$(date +%F).tar.gz -C /opt/stacks/reverse-proxy data
tar czf /opt/backups/npm/npm_letsencrypt_$(date +%F).tar.gz -C /opt/stacks/reverse-proxy letsencrypt
ls -lh /opt/backups/npm

## リストア（SSH）
# 1) 事前に停止（NPMがdocker compose配下なら該当ディレクトリで down）
docker stop npm

# 2) 退避
mkdir -p /opt/backups/npm/restore_bak_$(date +%F)
cp -a /opt/stacks/reverse-proxy/data /opt/backups/npm/restore_bak_$(date +%F)/
cp -a /opt/stacks/reverse-proxy/letsencrypt /opt/backups/npm/restore_bak_$(date +%F)/

# 3) 展開
rm -rf /opt/stacks/reverse-proxy/data /opt/stacks/reverse-proxy/letsencrypt
mkdir -p /opt/stacks/reverse-proxy
tar xzf /opt/backups/npm/npm_data_YYYY-MM-DD.tar.gz -C /opt/stacks/reverse-proxy
tar xzf /opt/backups/npm/npm_letsencrypt_YYYY-MM-DD.tar.gz -C /opt/stacks/reverse-proxy

# 4) 起動
docker start npm
docker logs npm --tail 50
