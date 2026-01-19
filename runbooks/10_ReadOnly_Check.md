# ReadOnly Check（事実ログ / 変更しない記録）
# Read-only 動作確認チェック（触らない）

---

## 目的
現在の構成が「少なくとも壊れていない」ことを、**設定変更・再起動・更新なし**で確認する。  
NGがあれば **変更せず状況を記録**し、snapshotを保存する。

---

## 事実ログ（変更しない記録）

### 2026-01-19
- n8n: ログイン画面表示OK
- Dify: アクセスOK
- ASR: https://asr.neurobase-lab.com/health が 502 Bad Gateway

#### Snapshot（Drive: 03_最新 snapshot）
- 2026-01-19_docker_ps.txt
- 2026-01-19_docker_network_ls.txt
- 2026-01-19_docker_inspect_npm.json
- 2026-01-19_ss_lntp.txt（未採取なら採取予定）

---

## 1. 稼働URL確認（閲覧のみ）

- [ ] ASR: https://asr.neurobase-lab.com  
  - 画面が表示される（エラーでない）

- [ ] Dify: https://dify.neurobase-lab.com  
  - ログイン画面が表示される

- [ ] n8n: https://n8n.neurobase-lab.com  
  - ログイン画面が表示される

※ 操作・ログイン・保存はしない

---

## 2. TLS / ドメイン確認（ブラウザ表示のみ）

- [ ] アドレスバーに「🔒」が表示される
- [ ] https:// に自動リダイレクトされる
- [ ] 証明書エラーが出ない

---

## 3. Nginx Proxy Manager 管理画面（閲覧のみ）

- [ ] https://<VPS-IP>:81 にアクセスできる
- [ ] Proxy Hosts に以下が **Online** 表示
  - asr.neurobase-lab.com
  - dify.neurobase-lab.com
  - n8n.neurobase-lab.com

※ Save / Edit / Restart はしない

---

## 4. VPS 側（確認コマンド・変更なし）

```bash
docker ps
docker compose ls
docker network ls
