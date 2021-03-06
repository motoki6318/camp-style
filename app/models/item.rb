class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_many :camp_item_relations
  has_many :camps, through: :camp_item_relations
  has_one_attached :image

  with_options presence: true do
    validates :genre_id, numericality: { other_than: 1, message: 'Select'}
    validates :name
    validates :feature
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
  
end
