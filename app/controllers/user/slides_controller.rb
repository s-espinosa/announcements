class User::SlidesController < User::BaseController

  def index
    @slides = Slide.all
  end

  def show
    @slide = Slide.find(params[:id])
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    @slide.user = current_user
    if @slide.save
      redirect_to user_slide_path(@slide)
    else
      render :new
    end
  end

  def edit
    @slide = Slide.find(params[:id])
  end

  def update
    @slide = Slide.find(params[:id])
    @slide.user = current_user
    if @slide.update(slide_params)
      flash[:success] = "Slide successfully updated"
      redirect_to user_slide_path(@slide)
    else
      render :edit
    end
  end

  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy
    redirect_to user_slides_path
  end

  private
  def slide_params
    params.require(:slide).permit(:title, :message, :image_url)
  end
end
