require 'rails_helper'

RSpec.describe 'GET /api/v1/slides' do
  it 'returns a list of all slides' do
    user = User.create(github: "s-espinosa")
    Fabricate.times(2, :slide, user: user)

    get '/api/v1/slides'

    expect(json_body.count).to eq(2)
  end
end
