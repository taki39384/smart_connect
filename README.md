# テーブル設計

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