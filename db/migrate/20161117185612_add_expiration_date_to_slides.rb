class AddExpirationDateToSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :slides, :expiration_date, :date
  end
end
