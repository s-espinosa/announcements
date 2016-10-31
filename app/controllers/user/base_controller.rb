class User::BaseController < ApplicationController
  before_action :authorize_user

  def authorize_user
    redirect_to login_path unless current_user
  end
end
