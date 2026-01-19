# infra-state（正本リンク集 / コンテキスト）

## 確認時点
- 2026-01-19（Asia/Tokyo）

## 目的
- VPS上の n8n / Dify / NPM / ASR の運用を、チャット分断に耐える形で固定する。
- GitHub = 正本（Runbook/規約/リンク）
- Google Drive = 重いログ・export・snapshot（証跡）

## 環境
- VPS Provider: XserverVPS
- OS: Ubuntu 22.04
- IP: 85.131.251.66
- SSH: root@x85-131-251-66

## 公開エンドポイント
- n8n:（UI表示OK / URLは運用側で記載）
- Dify:（UI表示OK / URLは運用側で記載）
- ASR: https://asr.neurobase-lab.com/health （2026-01-19時点で 502）

## リポジトリ（正本）
- infra-state: https://github.com/sty19jp-spec/infra-state

## Google Drive（保管）
- 01_NPM設定 Export
  https://drive.google.com/drive/folders/1G_7IQNwQ3Ku_miXY46dP0kGhW6U1IoyH?usp=sharing
- 02_XserverVPS 構成YAML
  https://drive.google.com/drive/folders/1Hx7t7aY6MXUE6o3nVyLL6kx7OXwtcdn9?usp=sharing
- 03_最新 snapshot
  https://drive.google.com/drive/folders/1PGjCUojaZXHiQUQi1jOG49psStPtIesJ?usp=sharing

## 運用の基本ルール（超重要）
- 変更前後で snapshot を取る（runbooks/10_Snapshot_Procedure.md）
- snapshot（生ログ）はDriveへ。Gitには「要約」と「リンク」と「差分が分かる情報」を残す。
- 秘密情報はGitに入れない（.env / 秘密鍵 / トークン等）
