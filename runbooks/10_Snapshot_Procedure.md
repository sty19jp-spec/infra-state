# Snapshot取得手順（変更前後で必ず実施）

## 1. 方針
- “コマンドそのもの” を保存するのではなく、**コマンドの実行結果（出力）**を保存する。
- 出力は txt / json として Driveeive に置く。
- GitHub には snapshot の一覧（いつ、何を採ったか、Driveのリンク）を残す。

## 2. SSH（VPS）で実行するコマンド（推奨セット）
以下を1つずつ実行して、出力をファイル化してDriveへ保存する。

### コンテナ一覧
docker ps

### ネットワーク一覧
docker network ls

### NPMの詳細（必要最小限）
docker inspect npm

### 待ち受けポート（ASR含む確認）
ss -lntp

## 3. ファイル命名規約（Drive）
- YYYY-MM-DD_項目.txt
- 例:
  - 2026-01-19_docker_ps.txt
  - 2026-01-19_docker_network_ls.txt
  - 2026-01-19_docker_inspect_npm.json
  - 2026-01-19_ss_lntp.txt

## 4. GitHub側（10_ReadOnly_Check.md）に追記する内容
- 日付
- 何を採ったか（ファイル名）
- Driveフォルダリンク（context.mdのリンクでOK）
- その時点の重要トピック（例: ASRが502）
