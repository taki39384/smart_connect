# アプリケーション名
SMART CONNECT

# アプリケーション概要
各携帯キャリアのキャンペーン期間を把握する社内管理アプリ。

# URL
https://smart-connect.onrender.com

# テスト用アカウント
- Basic認証パスワード：0810
- Basic認証ID : asu
- Googleアカウント
- メールアドレス :
- パスワード :

# 利用方法
## キャンペーン投稿
1. サインインページからユーザー新規登録か既存Googleアカウントでログインする
2. Campaign InformationのAddボタンから、キャンペーン内容（キャンペーン名・内容・開始日・終了日・携帯キャリア）、任意で画像とタグを投稿する

## チーム目標管理（実装中）
1. トップページのTEAM GOALリストから、項目・目標数・獲得数を入力する。
2. 達成率を計算して表示


# アプリケーションを作成した背景
家電量販店で携帯販売の提案をするときに、各キャリアキャンペーン期間がバラバラなので、それを一元管理できたらもっと提案しやすい環境になるのではないかと考えた。






















## users テーブル
| column             | type   | options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :tasks
- has_many :sns_credentials



## sns_credentials テーブル
| column             | type        | options                   |
| ------------------ | ------      | --------------------------|
| provider           | string      | null: false               |
| uid                | string      | null: false, unique: true |
| user               | references  | foreign_key: true         |

### Association
- belongs_to :user



## tasks テーブル
| column             | type        | options                                |
| ------------------ | ------      | -------------------------------------- |
| title              | string      | null: false                            |
| content            | string      | null: false                            |
| mobile_id          | integer     | null: false                            |
| start_time         | datetime    | null: false                            |
| end_time           | datetime    | null: false                            |
| user               | references  | null: false, foreign_key: true         |

### Association
- belongs_to :user