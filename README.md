# FURIMA-38705 テーブル設計

## usersテーブル

| column              | type   | options     |
| ------------------- | ------ | ----------- |
| email               | string | null: false |
| password            | string | null: false |
| nickname            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| katakana_first_name | string | null: false |
| katakana_last_name  | string | null: false |
| birth_day           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| detail          | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| shipping_from   | string     | null: false                    |
| shipping_date   | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orderテーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| post_address           | string  | null: false |
| prefecture             | string  | null: false |
| city_ward_town_village | string  | null: false |
| house_number           | string  | null: false |
| building_name          | string  | null: false |
| phone_number           | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item