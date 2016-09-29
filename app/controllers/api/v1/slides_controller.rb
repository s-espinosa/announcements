class Api::V1::SlidesController < Api::ApiController
  def index
    render json: Slide.all
  end
end
