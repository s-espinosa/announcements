require 'rails_helper'

RSpec.describe 'When a user visits `/slides/new`' do
  it 'they can create a new slide' do
    user = User.create(github: "s-espinosa")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/slides/new'

    fill_in('slide[title]', with: 'Slide title')
    fill_in('slide[message]', with: 'Slide message')
    fill_in('slide[image_url]', with: 'https://robohash.org/1')
    click_on('Create Slide')

    expect(page).to have_content('Slide successfully created')
    expect(page).to have_content('Slide title')
    expect(page).to have_content('Slide message')
  end
end
