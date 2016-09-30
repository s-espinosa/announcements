class SlidesController < ApplicationController
  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    if @slide.save
      flash[:success] = "Success!"
      redirect_to slide_path(@slide)
    else
      render :new
    end
  end

  def show
    @slide = Slide.find(params[:id])
  end

  private
  def slide_params
    params.require(:slide).permit(:title, :message, :image_url)
  end
end
