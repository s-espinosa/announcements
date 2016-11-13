require 'rails_helper'

RSpec.describe 'Admin can delete a slide' do
  it 'when they visit `admin/slides/show`' do
    admin = User.create(github: "s-espinosa", role: 1)
    user  = User.create(github: "someone", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    slide = user.slides.create(title: "Some", message: "other", image_url: "https://robohash.org/1")

    visit admin_slide_path(slide)
    click_on "Delete Slide"

    expect(current_path).to eq(admin_slides_path)
    expect(page).to have_content("Slide successfully destroyed")
    expect(page).to_not have_content("Some")
  end

  it 'when they visit `admin/slides`' do
    admin = User.create(github: "s-espinosa", role: 1)
    user  = User.create(github: "someone", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    user.slides.create(title: "Some", message: "other", image_url: "https://robohash.org/1")

    visit admin_slides_path
    click_on "Delete Slide"

    expect(current_path).to eq(admin_slides_path)
    expect(page).to have_content("Slide successfully destroyed")
    expect(page).to_not have_content("Some")
  end
end
