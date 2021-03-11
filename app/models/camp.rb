class Camp < ApplicationRecord
  belongs_to :user
  has_many :camp_tag_relations
  has_many :tags
  
  validates :title, presence: true

end
