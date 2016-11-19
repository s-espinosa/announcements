class BillboardController < ApplicationController
  layout 'billboard'
  skip_before_action :authorize_user

  def show
  end
end
