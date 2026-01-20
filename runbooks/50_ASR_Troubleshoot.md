# ASR（asr.neurobase-lab.com） 502 Troubleshoot

## 現象（2026-01-19）
- https://asr.neurobase-lab.com/health が 502 Bad Gateway

## 事実（採取済み）
- docker ps | grep -i asr  
  → ASRコンテナは存在しない（ホスト上Python実行構成）
- ss -lntp | grep 8000  
  → ASRが待ち受けしていなかった
- /opt/asr に asr_server.py と venv が存在  
  → FastAPI + uvicorn 構成

## まず潰すべき原因
- 最優先: ASRプロセスが起動していない
- 次点: NPM → ASR の到達経路 / ポート不一致

## 最短復旧手順（SSH）

### 1) ASRを手動起動して待ち受け確認
```bash
cd /opt/asr
/opt/asr/venv/bin/python -V
/opt/asr/venv/bin/uvicorn asr_server:app --host 0.0.0.0 --port 8000
