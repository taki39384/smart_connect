# テーブル設計

## users テーブル
| column             | type   | options                   |
| ------------------ | ------ | --------------------------|
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :tasks


## tasks テーブル
| column             | type       | options                        |
| ------------------ | ------     | --------------------------     |
| title              | string     | null: false                    |
| content            | text       | null: false                    |
| start_time         | datetime   | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user