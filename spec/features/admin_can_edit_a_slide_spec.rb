require 'rails_helper'

RSpec.describe 'When an admin visits `admin/slides/1/edit`' do
  it 'they can edit a slide' do
    admin = User.create(github: "s-espinosa", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    slide = admin.slides.create(title: "Some", message: "Extra", image_url:  'https://robohash.org/1')

    visit edit_admin_slide_path(slide)

    fill_in('slide[title]', with: 'Slide title')
    fill_in('slide[message]', with: 'New slide message')
    fill_in('slide[image_url]', with: 'https://robohash.org/1')
    click_on('Update Slide')

    expect(page).to have_content('Slide successfully updated')
    expect(page).to have_content('Slide title')
    expect(page).to have_content('New slide message')
  end
end
