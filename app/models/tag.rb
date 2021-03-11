class Tag < ApplicationRecord
  has_many :camp_tag_relations
  has_many :camps
end
