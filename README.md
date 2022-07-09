# README
user table

| Column             | Type     | Options                     |
| ------------------ | -------- | --------------------------- |
| nickname           | string   | null: false                 |
| email              | string   | null: false,unique: true    |
| encrypted_password | string   | null: false                 |
| last_name          | string   | null: false                 |
| first_name         | string   | null: false                 |
| last_name_kana     | string   | null: false                 |
| first_name_kana    | string   | null: false                 |
| date               | date     | null: false                 |

    
- has_many :items
- has_many :orders
 
 items table

| Column           | Type     | Options     |
| -----------------| -------- | ----------- |
| name             | string   | null: false |
| description_item | text     | null: false |
| category_id      | integer  | null: false |
| state_id         | integer  | null: false |
| load_id          | integer  | null: false |
| area_id          | integer  | null: false |
| date_time_id     | integer  | null: false |
| price            | integer  | null: false |


- belongs_to :user
- has_one :orders
- has_one :address

address table

| Column              | Type        | Options                        |
| --------------------| ----------- | -------------------------------|
| post_num            | string      | null: false                    |
| area                | string      | null: false                    |
| municipality    　　 | string      | null: false                    | 
| address_num     　　 | string      | null: false                    | 
| building_name   　　 | string      | null: false                    | 
| phone_num       　　 | string      | null: false                    | 
| orders_id       　　 | references  | null: false, foreign_key: true | 


- has_one :orders
- belongs_to :items


orders table

| Column           | Type      | Options                         |
| -----------------| --------- | --------------------------------|
| user_id          | references| null: false , foreign_key: true |
| item_id          | references| null: false , foreign_key: true |


- belongs_to :user
- belongs_to :item
- belongs_to :address