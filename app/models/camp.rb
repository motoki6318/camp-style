class Camp < ApplicationRecord
  belongs_to :user
  has_many :camp_tag_relations
  has_many :tags, through: :camp_tag_relations
  has_many :items, through: :camp_item_relations
  
  validates :title, presence: true

end
