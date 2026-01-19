# ASR（asr.neurobase-lab.com） 502 Troubleshoot

## 現象（2026-01-19）
- https://asr.neurobase-lab.com/health が 502 Bad Gateway

## 事実（採取済み）
- docker ps | grep -i asr => 何も出ない（ASRコンテナは存在しない/稼働していない）
- ss -lntp | grep 8000 => 何も出ない（ASRが待ち受けしていない）
- /opt/asr に asr_server.py と venv がある（ホスト上Python実行の構成）

## まず潰すべき原因
- “ASRプロセスが起動していない” が最優先
- 次に “NPMからASRへ到達できる経路/ポート” を確認

## 最短復旧手順（SSH）
### 1) ASRを手動起動して待ち受け確認
cd /opt/asr
/opt/asr/venv/bin/python -V
/opt/asr/venv/bin/uvicorn asr_server:app --host 0.0.0.0 --port 8000

別セッションで確認:
ss -lntp | grep 8000 || true
curl -i http://127.0.0.1:8000/ || true
curl -i http://127.0.0.1:8000/health || true

※ /health が404でも「到達できている」なら 502 は解消方向。

### 2) systemd化（再起動耐性）
- systemd/asr.service を配置し、enable --now する（後述の unit を使用）

### 3) NPM 側（概念）
- NPMの upstream が “生きている先” を向いていること
- ASRがホストで 0.0.0.0:8000 なら、NPMからは host gateway 経由で到達させるのが安定
  - 例: shared_net の gateway (172.18.0.1) を upstream にする、など

※ NPM設定の詳細は snapshot 取得後に確定する（誤設定のまま触らない）。
