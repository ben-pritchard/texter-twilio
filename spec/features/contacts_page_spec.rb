require 'rails_helper'

describe 'the adding a contact process' do
  it 'will add a new contact', js: true, vcr: true do
    visit root_path
    click_on 'add new contact'
    fill_in "Name", with: "Yo momma"
    fill_in "Number", with: "5412311102"
    click_on 'Save'
    expect(page).to have_content "Yo momma"
  end
end
