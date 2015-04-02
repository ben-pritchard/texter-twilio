require 'rails_helper'

describe 'the new message process' do
  it 'will send a new message to a contact yay', js: true, vcr: true do
    contact = FactoryGirl.create(:contact)
    message = FactoryGirl.create(:message)
    contact.messages.push(message)
    visit contact_path(contact)
    click_on 'send a new message'
    fill_in 'To', with: contact.number
    fill_in 'From', with: "5032134044"
    fill_in 'Body', with: "i am superman"
    click_on 'Send'
    expect(page).to have_content('Message: i am superman')
  end

  it 'will send a new message to a contact, yay!', js: true, vcr: true do
    visit root_path
    click_on ''
  end
end

describe 'the delete a message process' do
  it 'will delete a message', js: true, vcr: true do
    contact = FactoryGirl.create(:contact)
    message = FactoryGirl.create(:message)
    contact.messages.push(message)
    visit contact_path(contact)
    click_on 'X'
    expect(page).to have_no_content message.body
  end
end
