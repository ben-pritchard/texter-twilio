require 'rails_helper'

describe 'the new message process' do
  it 'will send a new message yay', js: true, vcr: true do
    visit root_path
    click_on 'send a new message'
    fill_in 'To', with: "7038506948"
    fill_in 'From', with: "5032134044"
    fill_in 'Body', with: "i am batman"
    click_on 'Send'
    within(first('div.message')) do
      expect(page).to have_content('Message: i am batman')
    end
  end
end
