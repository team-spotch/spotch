class CreateCircleEventLocations < ActiveRecord::Migration
  def change
    create_table :circle_event_locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :circle_event_id

      t.timestamps null: false
    end
  end
end
