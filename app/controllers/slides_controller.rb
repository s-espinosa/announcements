class SlidesController < ApplicationController

  def index
    @slides = current_user.slides
  end

  def show
    @slide = Slide.find(params[:id])
    protect_users
  end

  def new
    @slide = Slide.new
    @dates = Array.new(14) do |n|
      Date.today + n
    end
  end

  def create
    @slide = Slide.new(slide_params)
    @slide.user = current_user
    if @slide.save
      flash[:success] = "Slide successfully created"
      redirect_to slide_path(@slide)
    else
      render :new
    end
  end

  def edit
    @slide = Slide.find(params[:id])
    protect_users
  end

  def update
    @slide = Slide.find(params[:id])
    protect_users
    if @slide.update(slide_params)
      flash[:success] = "Slide successfully updated"
      redirect_to slide_path(@slide)
    else
      render :edit
    end
  end

  def destroy
    @slide = Slide.find(params[:id])
    protect_users
    @slide.destroy
    redirect_to slides_path
  end

  private
  def slide_params
    params.require(:slide).permit(:title, :message, :image_url, :expiration_date)
  end

  def protect_users
    raise ActionController::RoutingError.new('Not Found') if @slide.user != current_user
  end
end
