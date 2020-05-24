class User < ApplicationRecord 
  validates :username, presence: true, uniqueness: true

  has_many :transactions, foreign_key: :author_id
end
