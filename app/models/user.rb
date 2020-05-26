# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord 
  validates :username, presence: true, uniqueness: true

  has_many :expenses, foreign_key: :author_id
  has_many :groups, through: :expenses

  def external_expenses
    expenses.left_joins(:expenses_groups).where('expenses_groups.group_id is ?', nil)
  end
end
