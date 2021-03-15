class Genre < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: 'テント'},
    {id: 3, name: 'ランタン'},
    {id: 4, name: 'シュラフ'},
    {id: 5, name: 'マット'},
    {id: 6, name: 'テーブル'},
    {id: 7, name: 'チェア'},
    {id: 8, name: 'ペグ'},
    {id: 9, name: 'ナイフ'},
    {id: 10, name: 'ハンマー'},
    {id: 11, name: 'タープ'},
    {id: 12, name: 'ヘッドライト'},
    {id: 13, name: '寝具'},
    {id: 14, name: '焚き火台'},
    {id: 15, name: 'クッカー'},
    {id: 16, name: 'カトラリー'},
    {id: 17, name: '食器'},
    {id: 18, name: 'バーナー'},
    {id: 19, name: 'ストーブ'},
    {id: 20, name: '斧'},
    {id: 21, name: '薪ストーブ'},
    {id: 22, name: 'ハンモック'},
    {id: 23, name: 'リュック'},
    {id: 24, name: 'ノコギリ'},
    {id: 25, name: '収納'},
    {id: 26, name: 'スコップ'},
    {id: 27, name: 'ファイヤスターター'},
    {id: 28, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :items

end