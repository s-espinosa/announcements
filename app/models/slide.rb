class Slide < ApplicationRecord
  belongs_to :user
  has_attached_file :image
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def image_url
    image.url
  end
end
