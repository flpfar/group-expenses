class User < ApplicationRecord
  validates_uniqueness_of :username
  validates :username, presence: true, uniqueness: true
end
