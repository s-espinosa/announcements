class AddApprovedToSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :slides, :status, :integer, default: 0
  end
end
