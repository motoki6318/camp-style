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
| place        | string     | null: false                    |
| text         | text       |                                |
| the_day      | date       | null: false                    |

### Associations

- belongs_to :user
- nas_many :tags, through: camp_tag_relations
- has_many :items, through: camp_item_relations

## tags テーブル

| Column | Type   | Options                        |
| ------ | ------ | ------------------------------ |
| style  | string | null: false, uniqueness: true  |

### Associations

- has_many :camps, through: :camp_tag_relations
- has_many :camp_tag_relations

## camp_tag_relations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| camp         | references | null: false, foreign_key: true |
| tag          | references | null: false, foreign_key: true |

### Associations

- belongs_to :camp
- belongs_to :tag

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| genre_id | integer    | null: false                    |
| name     | string     | null: false                    |
| feature  | string     | null: false                    |
| price    | integer    | null: false                    |

### Associations

- belongs_to :user
- has_many :camps, through: camp_item_relations

## camp_item_relations テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| camp   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations

- belongs_to :camp
- belongs_to :item
