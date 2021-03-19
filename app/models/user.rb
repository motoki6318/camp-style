class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :camps
  has_many :items
  
  validates :nickname, presence: true
end
