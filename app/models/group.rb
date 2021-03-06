# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  icon       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
  has_and_belongs_to_many :expenses
  before_destroy do
    expenses.each(&:destroy)
  end

  validates :name, presence: true, uniqueness: true
end
