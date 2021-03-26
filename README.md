# CAMP-STYLE

## アプリの概要
キャンプ記録を登録して閲覧するアプリです。  
キャンプアイテムを登録してキャンプに持っていた記録を残すことができます。

## アプリの機能

### 1.キャンプ情報登録機能
- キャンプ情報は編集可能です。

### 2.アイテム情報登録機能
- アイテム情報は編集可能です。

### 3.キャンプ情報閲覧機能

### 4.アイテム情報閲覧機能


### 制作背景
私の趣味はキャンプなのですが、キャンプを始めようとしたときにキャンプには様々なスタイルがあって、スタイルごとに必要なアイテムが異なることを知りました。  
キャンプ初心者としてはどんなアイテムを買えばいいのかわかりませんし、総額がいくらかかるのかというのもわかりませんでした。  
キャンプ初心者のために、キャンプ経験者はどんなアイテムを持っていっているのか、キャンプスタイルによってどのくらいの金額がかかるのかを知ることができる場を作ろうと思ったのがきっかけです。

# DEMO

- [アプリを見る](https://camp-style.herokuapp.com/)
- BASIC_AUTH_USER: admin
- BASIC_AUTH_PASSWORD: 2222
- テストアカウント email: camp@email
- テストアカウント password: asdf123

### 最初の画面
![画像](https://raw.githubusercontent.com/motoki6318/camp-style/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-03-23%2017.40.27.png)

### アイテムの登録の様子
![demo](https://user-images.githubusercontent.com/78415358/112128588-e9339c00-8c09-11eb-99d3-9926502fd157.gif)

- アイテムの総額の計算が自動で行われています。
- アイテム情報には、種類、名前、画像、説明文、値段の情報を登録します。
- アイテムの使用履歴が存在しない時は、現在使用履歴はありません。と表示されます。

### キャンプ記録登録の様子
![camp](https://user-images.githubusercontent.com/78415358/112131506-f7cf8280-8c0c-11eb-93b4-a52110e5c2f3.gif)

- キャンプ記録登録には、タイトル、画像、場所、キャンプスタイル、感想、日付、使用アイテムを登録します。
- キャンプ記録登録後、キャンプ一覧ページにはキャンプスタイルとキャンプスタイルに属しているキャンプ記録が表示されています。
- キャンプの詳細ページには、使用したアイテムが一覧表示されています。
- 使用したアイテムの総額が自動で計算されて表示されています。
- アイテム名をクリックするとアイテム詳細ページに遷移します。
- アイテム詳細のアイテムの使用履歴には持っていったキャンプのタイトルが表示されています。

### 工夫した点
- アイテム単体の価格が40,000円以上の時値段の横に(高額アイテム)と表示されるようにしたこと
- キャンプアイテムの総額が200,000円以上の時総額の横に(高額)と表示されるようにしたこと
- アイテムの名前の横に数字を振ったこと
<img width="731" alt="スクリーンショット 2021-03-24 9 34 52" src="https://user-images.githubusercontent.com/78415358/112236603-3a807180-8c84-11eb-9559-0aa619cd1ab7.png">




# 今後追加したい機能
- ユーザーのマイページを作ってユーザーの投稿したキャンプ記録を一覧表できる機能があると自分がどのような投稿をしたのかを容易に把握できると思いました。
- ユーザー同士のコミュニケーションを図るためにコメント機能をキャンプ詳細ページに実装したいと思いました。
- 投稿件数によってユーザー名の表示が変わるようにしても面白いと思いました。（ベテランキャンパーの投稿かどうか一目で判断がつく）

## 開発環境
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code

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
| day          | date       | null: false                    |

### Associations

- belongs_to :user
- nas_many :tags, through: camp_tag_relations
- has_many :items, through: camp_item_relations
- has_one_attached :image

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
- has_one_attached :image

## camp_item_relations テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| camp   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations

- belongs_to :camp
- belongs_to :item
