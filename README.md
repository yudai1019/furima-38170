# README
users table

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

| Column           | Type        | Options                        |
| -----------------| ----------- | ------------------------------ |
| name             | string      | null: false                    |
| description_item | text        | null: false                    |
| category_id      | integer     | null: false                    |
| state_id         | integer     | null: false                    |
| load_id          | integer     | null: false                    |
| area_id          | integer     | null: false                    |
| wait_id          | integer     | null: false                    |
| price            | integer     | null: false                    |
| user      　     | references  | null: false, foreign_key: true | 


- belongs_to :user
- has_one :order

address table

| Column           | Type        | Options                        |
| -----------------| ----------- | -------------------------------|
| postnum         | string      | null: false                    |
| area_id          | integer     | null: false                    |
| municipality     | string      | null: false                    | 
| addressnum      | string      | null: false                    | 
| buildingname    | string      |                    　　　　　　  | 
| phonenum        | string      | null: false                    | 
| order      　    | references  | null: false, foreign_key: true | 


- belongs_to :order



orders table

| Column        | Type      | Options                         |
| --------------| --------- | --------------------------------|
| user          | references| null: false , foreign_key: true |
| item          | references| null: false , foreign_key: true |



- belongs_to :user
- belongs_to :item
- has_one :address