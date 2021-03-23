# CAMP-STYLE

### アプリの概要
- キャンプの記録をするアプリケーションです。
- キャンプのアイテムを登録します。
- キャンプ記録で登録したアイテムの中からどのアイテムを持っていったかを選択できます。
- キャンプ記録にはキャンプスタイルを登録します。キャンプスタイルはタグの機能を持っています。
- キャンプがどのスタイルに属しているのかを一覧表示します。
- キャンプ詳細ページではキャンプに持っていったアイテムを一覧表示します。
- キャンプに使用したアイテムの値段の総額を表示します。

### 制作背景
私の趣味はキャンプなのですが、キャンプを始めようとしたときにキャンプには様々なスタイルがあって、スタイルごとに必要なアイテムが異なることを知りました。  
キャンプ初心者としてはどんなアイテムを買えばいいのかわかりませんし、総額がいくらかかるのかというのもわかりませんでした。  
キャンプ初心者のために、キャンプ経験者はどんなアイテムを持っていっているのか、キャンプスタイルによってどのくらいの金額がかかるのかを知ることができる場を作ろうと思ったのがきっかけです。

# DEMO

- [アプリを見る](https://camp-style.herokuapp.com/)

最初の画面
![画像](https://raw.githubusercontent.com/motoki6318/camp-style/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-03-23%2017.40.27.png)



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
