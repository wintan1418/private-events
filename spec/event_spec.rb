require 'rails_helper'

RSpec.describe 'Event', type: :model do
  it 'is valid when no element is empty' do
    user = User.create(name: 'Juwon')
    event = Event.create(description: 'Hello Im Juwon', date: Date.today.to_s, creator_id: user.id)
    expect(event).to be_valid
  end

  it 'not valid when one absent element exits' do
    user = User.create(name: 'Juwon')
    event = Event.create(description: 'Hello Im Juwon', creator_id: user.id)
    expect(event).not_to be_valid
  end

  it 'not valid when there is not a creator of the event' do
    event = Event.create(description: 'Hello Im Juwon', date: '21-08-02')
    expect(event).not_to be_valid
  end

  describe 'associations' do
    it 'belongs to a creator' do
      event = Event.reflect_on_association(:creator)
      expect(event.macro).to eql(:belongs_to)
    end
    it 'has many attendees' do
      event = Event.reflect_on_association(:attendees)
      expect(event.macro).to eql(:has_many)
    end
  end
end

# rubocop:disable Metrics/BlockLength

RSpec.feature 'Events' do
  before(:each) do
    @user = User.create(name: 'Leandro')
  end

  before(:each) do
    @event = @user.events.build(description: 'Hi Im Leandro', date: '1999-07-10')
    @event.save
  end

  scenario 'when an event is created by user' do
    visit '/login'
    fill_in 'Name:', with: 'Leandro'
    click_on 'Log In'
    click_on 'Create Event'
    fill_in 'Description:', with: 'something goes in here'
    fill_in 'Date:', with: '2021-01-01'
    click_on 'Create'
    expect(page).to have_content 'something goes in here'
  end

  scenario 'when an event is created by user but it leaves a blank field' do
    visit '/login'
    fill_in 'Name:', with: 'Leandro'
    click_on 'Log In'
    click_on 'Create Event'
    fill_in 'Description:', with: ''
    fill_in 'Date:', with: '2021-01-01'
    click_on 'Create'
    expect(page).to have_content 'Invalid Event!'
  end

  scenario 'when a user what to see a event' do
    visit root_path
    click_on 'View'
    expect(page).to have_content 'Event'
  end

  scenario 'when a user attends an event' do
    visit '/login'
    fill_in 'Name:', with: 'Leandro'
    click_on 'Log In'
    click_on 'Attend'
    expect(@event.attendees.exists?(@user.id)).to eql(true)
  end
end

# rubocop:enable Metrics/BlockLength
