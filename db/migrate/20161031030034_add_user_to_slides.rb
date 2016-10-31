class AddUserToSlides < ActiveRecord::Migration[5.0]
  def change
    add_reference :slides, :user, foreign_key: true
  end
end
