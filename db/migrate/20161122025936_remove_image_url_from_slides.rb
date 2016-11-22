class RemoveImageUrlFromSlides < ActiveRecord::Migration[5.0]
  def change
    remove_column :slides, :image_url
  end
end
