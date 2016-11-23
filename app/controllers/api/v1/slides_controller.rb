class Api::V1::SlidesController < Api::ApiController
  def index
    render json: Slide.approved.to_json(methods: [:image_url])
  end
end
