# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  it 'username should not be empty' do
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end
  it 'username should be unique' do
    existing_user = create(:user)
    user.username = existing_user.username
    user.valid?
    expect(user.errors[:username]).to include('has already been taken')
  end
end
