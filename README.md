# README

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| first_name_kana    | string   | null: false |
| date               | datetime | null: false |


- has_many :items
- has_one :address
- has_many :orders


| Column           | Type     | Options     |
| -----------------| -------- | ----------- |
| image            | text     | null: false |
| name             | string   | null: false |
| description_item | text     | null: false |
| category         | string   | null: false |
| state            | string   | null: false |
| load             | string   | null: false |
| area             | string   | null: false |
| date_time        | string   | null: false |
| price            | integer  | null: false |


- belongs_to :user
- has_one :orders


| Column           | Type     | Options     |
| -----------------| -------- | ----------- |
| post_num         | string   | null: false |
| area             | string   | null: false |
| municipality     | string   | null: false |
| address_num      | string   | null: false |
| building_name    | string   | null: false |
| phone_num        | string   | null: false |


- belongs_to :user


| Column           | Type      | Options                         |
| -----------------| --------- | --------------------------------|
| user_id          | references| null: false , foreign_key: true |
| items_id         | references| null: false , foreign_key: true |


- belongs_to :user
- belongs_to :items