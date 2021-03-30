class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :camp

  validates :comment_text, presence: true
end
