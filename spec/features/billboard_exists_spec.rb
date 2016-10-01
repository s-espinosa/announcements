require 'rails_helper'

RSpec.describe 'When a user visits `/`' do
  it 'they see a blank page' do
    visit '/'

    expect(current_path).to eq('/')
  end
end
