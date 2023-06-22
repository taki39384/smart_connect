# アプリケーション名
SMART CONNECT

# アプリケーション概要
各携帯キャリアのキャンペーン期間、モバイル情報、チーム目標を一元管理し把握する社内管理アプリ。

# URL
https://smart-connect.onrender.com

# テスト用アカウント
- Basic認証パスワード：0810
- Basic認証ID : asu
- Googleアカウント
- メールアドレス :
- パスワード :

# 利用方法
社内の共有PCから利用することを想定とする。

## キャンペーン投稿
1. サインインページからユーザー新規登録か既存Googleアカウントでログインする
2. Campaign InformationのAddボタンから、キャンペーン内容（キャンペーン名・内容・開始日・終了日・携帯キャリア）、任意で画像とタグを投稿する

## チーム目標管理（会社PCのみ）
1. トップページのTEAM GOALリストから、項目・目標数・獲得数を入力する。
2. 達成率を計算して表示

## モバイル情報メモ管理
1. 気になるモバイル情報をメモ登録する。
2. 新規に投稿したメモは一番上に表示される


# アプリケーションを作成した背景
家電量販店での携帯販売の提案が各キャリアキャンペーン期間がバラバラであり、モバイル情報過多で覚えるのが大変という課題がある。
このアプリケーションは、その課題解決をして、もっとより良い案内ができ獲得実績向上を目指せるものである。
また毎月、項目ごとに獲得目標があり、その管理も一元管理できるものにした。

# 洗い出した要件
[要件定義書](https://docs.google.com/spreadsheets/d/1PKDI-YDM1qh6pzkRlcT_2DXz8lBpSfiJ_6Bp4SIEkX0/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
〜〜  画像やGIF、説明を記載  〜〜

# 実装予定の機能
タグ検索機能
Notion API導入

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/5dda738f2abc53d3366c24be12608ca6.png)](https://gyazo.com/5dda738f2abc53d3366c24be12608ca6)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/97e2ca6914555f6c1ffeb4f1daf92d2f.png)](https://gyazo.com/97e2ca6914555f6c1ffeb4f1daf92d2f)

# 開発環境
- HTML&CSS
- Bootstrap
- Ruby
- Rails
- JavaScript
- Render
- テスト
- VS Code
- GiT hub
- Notion

# ローカルでの動作方法


# 工夫したポイント
チーム目標のリストについて,JavaScriptのローカルストレージ（社内共有PCで使うことを想定しているため）に保存する機能を実装し、トップページに表示できるようにした。また獲得数に応じて達成率を計算できるようにした。
