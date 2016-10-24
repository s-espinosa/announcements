class SlidesController < ApplicationController
  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    if @slide.save
      flash[:success] = "Success! <a href='/slides/#{@slide.id}/edit'>Edit this slide</a>"
      redirect_to slide_path(@slide)
    else
      render :new
    end
  end

  def show
    @slide = Slide.find(params[:id])
  end

  def edit
    @slide = Slide.find(params[:id])
  end

  def update
    @slide = Slide.find(params[:id])
    if @slide.update(slide_params)
      flash[:success] = "Success! <a href='/slides/#{@slide.id}/edit'>Edit this slide</a>"
      redirect_to slide_path(@slide)
    else
      render :edit
    end
  end

  private
  def slide_params
    params.require(:slide).permit(:title, :message, :image_url)
  end
end
