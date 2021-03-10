# テーブルの設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :camps
- has_many :items

## camps テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| title        | string     | null: false                    |
| style_id     | integer    | null: false                    |
| participant  | integer    | null: false                    |
| season_id    | integer    | null: false                    |

### Associations

- belongs_to :user
- has_many :items, through: camp_items

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| genre_id | integer    | null: false                    |
| name     | string     | null: false                    |
| type     | string     | null: false                    |
| price    | integer    | null: false                    |

### Associations

- belongs_to :user
- has_many :camps, through: camp_items

## camp_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| camp   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations

- belongs_to :camp
- belongs_to :item
