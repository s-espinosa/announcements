class Api::V1::SlidesController < Api::ApiController
  def index
    render json: Slide.all.to_json(methods: [:image_url])
  end
end
