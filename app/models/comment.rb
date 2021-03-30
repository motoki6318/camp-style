class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :camp

  validates :message, presence: true
end
