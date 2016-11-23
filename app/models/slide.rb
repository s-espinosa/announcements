class Slide < ApplicationRecord
  belongs_to :user

  has_attached_file :image
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  enum status: [:unapproved, :approved]

  def image_url
    image.url
  end

  def title_with_blanks
    if title == ""
      "No title"
    else
      title
    end
  end
end
