class CampItemRelation < ApplicationRecord
  belongs_to :camp
  belongs_to :item
end
