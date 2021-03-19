class Tag < ApplicationRecord
  has_many :camp_tag_relations
  has_many :camps, through: :camp_tag_relations

  validates :style, uniqueness: true
  validates :style, presence: true
end
