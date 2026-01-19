# Snapshot取得手順（変更前後で必ず実施）

## 1. 方針

* “コマンドそのもの” を保存するのではなく、**コマンドの実行結果（出力）**を保存する。
* 出力は txt / json 形式とする。
* **生ログ（txt/json）は GitHub に保存しない。**
* 生ログは **Google Drive の `03_最新 snapshot/`** に保存し、
  GitHub には「いつ・何を採ったか・どこに置いたか」だけを記録する。

---

## 2. 命名規則（固定）

### 2-1. Drive 側フォルダ構成（必須）

* `03_最新 snapshot/`

  * `YYYY-MM-DD_<TASK>_before/`
  * `YYYY-MM-DD_<TASK>_after/`

### 2-2. VPS 側作業フォルダ構成（推奨）

* `~/snapshot/YYYY-MM-DD_<TASK>_before/`
* `~/snapshot/YYYY-MM-DD_<TASK>_after/`

### 2-3. <TASK> 命名例

* `ASR502`（ASR 502対応）
* `NPMFix`（Nginx Proxy Manager修正）
* `N8nUpgrade`（n8nアップグレード）

---

## 3. Snapshot Procedure（固定セット：出力をファイル化）

### 3-1. Before（変更前）

※ **変更作業を行う前に必ず実施**

```bash
# 実行場所: SSH（VPS）
TASK="ASR502"
D="$HOME/snapshot/$(date +%F)_${TASK}_before"
mkdir -p "$D"

docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Ports}}' > "$D/docker_ps.txt"
docker network ls > "$D/docker_network_ls.txt"
docker inspect npm > "$D/npm_inspect.json"
ss -lntp > "$D/ss_lntp.txt"
```

---

### 3-2. After（変更後）

※ **変更作業が完了した直後に必ず実施**

```bash
# 実行場所: SSH（VPS）
TASK="ASR502"
D="$HOME/snapshot/$(date +%F)_${TASK}_after"
mkdir -p "$D"

docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Ports}}' > "$D/docker_ps.txt"
docker network ls > "$D/docker_network_ls.txt"
docker inspect npm > "$D/npm_inspect.json"
ss -lntp > "$D/ss_lntp.txt"
```

---

## 4. Drive への保存ルール（実行しない・取説）

* VPS 上で作成した以下のフォルダを **そのままの名前で** Drive にコピーする。

  * `~/snapshot/YYYY-MM-DD_<TASK>_before/`
  * `~/snapshot/YYYY-MM-DD_<TASK>_after/`
* 保存先は **Google Drive の `03_最新 snapshot/`** とする。
* Drive 側では **Before / After を同一日・同一TASKで並べて保持**する。

---

## 5. GitHub 側への記録（10_ReadOnly_Check.md）

生ログは置かず、**以下の情報のみを記録する**。

* 実施日（YYYY-MM-DD）
* TASK 名
* 取得した snapshot の内容（例: docker / network / npm / port）
* Drive フォルダのリンク（`context.md` に記載のリンクでOK）
* 当時の重要トピック（例: ASR が 502 を返していた）
