require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Users', type: :feature do
  before(:each) do
    visit root_path
  end

  def fill_username_and_click(username)
    fill_in 'username', with: username
    find("input[type='submit']").click
  end

  it 'login successfully' do
    create(:user, username: 'random')
    fill_username_and_click('random')
    expect(page).to have_content('Welcome')
  end

  it 'login fails when user is not signed up' do
    fill_username_and_click('random')
    expect(page).to have_content('Login failed')
  end

  it 'are redirected to profile page when login is sucessfull' do
    user = create(:user, username: 'random')
    fill_username_and_click('random')
    expect(page).to have_current_path(user_path(user.id))
  end

  it 'signup successfully' do
    visit new_user_path
    fill_username_and_click('felipe')
    expect(page).to have_content('Welcome')
  end

  it 'are redirected to profile page when signup is sucessfull' do
    visit new_user_path
    fill_username_and_click('random')
    expect(page).to have_current_path(user_path(user.id))
  end

  it 'signup fails when username was already taken' do
    create(:user, username: 'felipe')
    visit new_user_path
    fill_username_and_click('felipe')
    expect(page).to have_content('already taken')
  end
end
# rubocop:enable Metrics/BlockLength
