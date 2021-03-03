require 'rails_helper'

RSpec.describe 'User', type: :model do
  it 'is valid with a name' do
    user = User.create(name: 'Leandro')
    expect(user).to be_valid
  end

  it 'is not valid when name is blank' do
    user = User.create(name: '')
    expect(user).not_to be_valid
  end

  describe 'associations' do
    it 'can have many events' do
      user = User.reflect_on_association(:events)
      expect(user.macro).to eql(:has_many)
    end

    it 'can have many events to attend' do
      user = User.reflect_on_association(:attended_events)
      expect(user.macro).to eql(:has_many)
    end
  end
end

# rubocop:disable Metrics/BlockLength

RSpec.feature 'Users' do
  before(:each) do
    @user = User.create(name: 'Leo')
  end

  before(:each) do
    @event = @user.events.build(description: 'Hello World', date: '2020-01-15')
    @event.save
  end

  scenario 'when login button is pressed' do
    visit root_path
    click_on 'Login'
    expect(page).to have_content 'Login'
  end

  scenario 'when login is sucessful' do
    visit '/login'
    fill_in 'Name:', with: 'Leo'
    click_on 'Log In'
    expect(page).to have_content 'MyEvents'
    expect(page).to have_content 'Log Out'
    expect(current_path).to eql(root_path)
  end

  scenario 'when you trying to login with a different name' do
    visit '/login'
    fill_in 'Name:', with: 'Jonh'
    click_on 'Log In'
    expect(page).to have_content 'Incorrect name, please try again!'
  end

  scenario 'when logout is sucessful' do
    visit '/login'
    fill_in 'Name:', with: 'Leo'
    click_on 'Log In'
    expect(page).to have_content 'MyEvents'
    expect(page).to have_content 'Log Out'
    click_on 'Log Out'
    expect(page).not_to have_content 'MyEvents'
  end

  scenario 'when a new user signs up' do
    visit '/users/new'
    fill_in 'Name', with: 'Juwon'
    click_on 'Create User'
    expect(page).to have_content 'Log Out'
    expect(page).not_to have_content 'Login'
  end

  scenario 'when you trying to sign up with a name that is already taken' do
    visit '/users/new'
    fill_in 'Name', with: 'Leo'
    click_on 'Create User'
    expect(page).to have_content 'Sign Up'
  end
end
# rubocop:enable Metrics/BlockLength
