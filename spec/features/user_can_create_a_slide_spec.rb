require 'rails_helper'

RSpec.describe 'When a user visits `/slides/new`' do
  it 'they can create a new slide' do
    visit '/slides/new'

    fill_in('slide[title]', with: 'Slide title')
    fill_in('slide[message]', with: 'Slide message')
    fill_in('slide[image_url]', with: 'https://robohash.org/1')
    click_on('Create Slide')

    save_and_open_page
    expect(page).to have_content('Success!')
    expect(page).to have_content('Slide title')
    expect(page).to have_content('Slide message')
  end
end
