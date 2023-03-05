# FURIMA-38705 テーブル設計

## usersテーブル

| column              | type   | options                   |
| ------------------- | ------ | ------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nickname            | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| katakana_first_name | string | null: false               |
| katakana_last_name  | string | null: false               |
| birth_day           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| detail             | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| post_address           | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| city_ward_town_village | string     | null: false                    |
| house_number           | string     | null: false                    |
| building_name          | string     |                                |
| phone_number           | string     | null: false                    |
| order                  | references | null: false, foreign_key: true |

### Association

- belongs_to :order