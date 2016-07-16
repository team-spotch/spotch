class CreateCircleEvents < ActiveRecord::Migration
  def change
    create_table :circle_events do |t|
      t.string :title
      t.text :desc
      t.date :event_date
      t.string :place
      t.string :one_phrase

      t.timestamps null: false
    end
  end
end
