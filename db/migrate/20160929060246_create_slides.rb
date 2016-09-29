class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.string :title
      t.string :message
      t.string :image_url

      t.timestamps null: false
    end
  end
end
