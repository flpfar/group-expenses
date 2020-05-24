class User < ApplicationRecord 
  validates :username, presence: true, uniqueness: true

  has_many :expenses, foreign_key: :author_id
  has_many :groups, through: :expenses
end
