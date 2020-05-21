require 'rails_helper'

RSpec.describe User, type: :model do
  it 'username should not be empty'
  it 'username should be unique'
end
