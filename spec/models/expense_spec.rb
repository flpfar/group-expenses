# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  amount     :decimal(, )      not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Expense, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
