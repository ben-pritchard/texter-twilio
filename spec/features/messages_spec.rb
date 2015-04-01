require 'rails_helper'

describe 'the new message process' do
  it 'will display error message if input not correct', js: true do
    visit root_path
    click_on 'send a new message'
    click_on 'Send'
    expect(page).to have_content('ERROR')
  end

  it 'will send a new message yay', js: true do
    visit root_path
    click_on 'send a new message'
    fill_in 'To', with: "5412311102"
    fill_in 'From', with: "5032134044"
    fill_in 'Body', with: "LOLOOLOLOLOL"
    click_on 'Send'
    expect(page).to have_content('LOLOOLOLOLOL')
  end
end
