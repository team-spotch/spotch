class AddImageToCircleEvents < ActiveRecord::Migration
  def change
    add_column :circle_events, :image, :string
  end
end
