# このプロジェクトの使い方（固定）

## 1. 正本の役割分担
- GitHub: Runbook / 要約（inventory）/ 参照リンク
- Google Drive: 生ログ（snapshot txt/json）, export, 大容量アーカイブ
- VPS: 実環境

## 2. 毎回の流れ（固定）
1) TASKを決める（例: ASR502 / NPMFix）
2) Before snapshot を取る（SSHでコマンド実行 → 出力ファイル化）
3) 変更作業をする
4) After snapshot を取る（同じセット）
5) 生ログを Drive の 03_最新 snapshot/ に置く
6) GitHubの inventory に「どこに置いたか」を1行で記録する（生ログはGitに置かない）

## 3. ChatGPTへの投げ方（固定）
次の2行だけ投げる：
- TASK: <TASK名>
- 今日の変更: <やること>

例:
TASK: ASR502
今日の変更: systemd化

→ 返ってきた「SSHで貼るコマンド」を VPS に貼って実行する。
