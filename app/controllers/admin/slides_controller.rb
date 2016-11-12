class Admin::SlidesController < ApplicationController
  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    @slide.user = current_user
    if @slide.save
      flash[:success] = "Slide successfully created"
      redirect_to admin_slide_path(@slide)
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
      flash[:success] = "Slide successfully updated"
      redirect_to admin_slide_path(@slide)
    else
      redirect_to :edit
    end
  end

  private
  def slide_params
    params.require(:slide).permit(:title, :message, :image_url)
  end
end
