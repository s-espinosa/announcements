class Admin::SlidesController < Admin::BaseController

  def index
    @slides = Slide.all
  end

  def show
    @slide = Slide.find(params[:id])
  end

  def new
    @slide = Slide.new
    @dates = fourteen_days
  end

  def create
    @slide = Slide.new(slide_params)
    @slide.user = current_user
    @slide.approved!
    if @slide.save
      flash[:success] = "Slide successfully created"
      redirect_to admin_slide_path(@slide)
    else
      flash[:failure] = "Error creating slide"
      @dates = fourteen_days
      render :new
    end
  end

  def edit
    @slide = Slide.find(params[:id])
    @dates = fourteen_days
  end

  def update
    @slide = Slide.find(params[:id])
    if @slide.update(slide_params)
      @slide.approved!
      flash[:success] = "Slide successfully updated"
      redirect_to admin_slide_path(@slide)
    else
      flash[:failure] = "Error updating slide"
      @dates = fourteen_days
      redirect_to :edit
    end
  end

  def destroy
    @slide = Slide.find(params[:id])
    if @slide.destroy
      flash[:success] = "Slide successfully destroyed"
      redirect_to admin_slides_path
    else
      flash[:failure] = "There was a problem destroying this slide"
      render :show
    end
  end

  private
  def slide_params
    params.permit(:title, :message, :image_url, :expiration_date, :image, :status)
  end

  def fourteen_days
    Array.new(14) do |n|
      Date.today + n
    end
  end
end
