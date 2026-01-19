# Runbook：変更とロールバック（最小版）

最終更新: 2026-01-19  
目的: 何かを変える前に「戻せる」を保証し、失敗したら最短で元に戻す。

---

## 0. 変更の原則（必ず守る）
- 変更前に snapshot を取る
- 変更は 1種類だけ（同時に複数いじらない）
- 変更後に Read-only チェックを通す
- NGなら「追加変更」ではなくロールバックを優先

---

## 1. 変更前チェック（触らない）
- 10_ReadOnly_Check.md を実施し、OKを確認する
- NGがある場合は「変更しない」

---

## 2. 変更前 snapshot（必須）
### 保存先（Drive）
- 03_最新 snapshot（フォルダ）

### 保存する内容（例）
- docker_ps_YYYY-MM-DD.txt
- docker_compose_ls_YYYY-MM-DD.txt
- docker_network_ls_YYYY-MM-DD.txt
- npm_mounts_YYYY-MM-DD.txt

---

## 3. 変更作業（1種類だけ）
変更対象の例
- NPM（Proxy Host / SSL / Access List）
- Docker Compose（pull / up -d）
- UFW / Fail2ban
- DNS（Aレコード）

※ ここでは手順は書かない。各作業の手順書に従う。

---

## 4. 変更後チェック（必須）
- 10_ReadOnly_Check.md を実施
- OKなら完了
- NGならロールバックへ

---

## 5. ロールバック（最小）
方針: 「止める → 戻す → 起動 → 確認」

### A) NPMの設定を戻す（考え方）
- /opt/stacks/reverse-proxy/data と letsencrypt が正本
- 変更前 snapshot から復元する
- 復元後にコンテナ再起動 → Read-only チェック

### B) compose更新を戻す（考え方）
- 変更前の compose / env に戻す
- docker compose up -d
- Read-only チェック

---

## 6. 変更ログ（必ず追記）
- 何を変えたか
- いつ（日時）
- どこ（対象）
- どう確認したか
- 結果（OK/NG、ロールバック有無）
