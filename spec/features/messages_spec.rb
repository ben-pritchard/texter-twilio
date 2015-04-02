require 'rails_helper'

describe 'the new message process' do
  it 'will send a new message yay', js: true, vcr: true do
    visit root_path
    click_on 'send a new message'
    fill_in 'To', with: "7038506948"
    fill_in 'From', with: "5032134044"
    fill_in 'Body', with: "i am superman"
    click_on 'Send'
    expect(page).to have_content('Message: i am superman')
  end
end

describe 'the delete a message process' do
  it 'will delete a message', js: true, vcr: true do
    message = FactoryGirl.create(:message)
    visit root_path
    save_and_open_page
    click_on 'x'
    expect(page).to have_no_content message.body
  end
end
