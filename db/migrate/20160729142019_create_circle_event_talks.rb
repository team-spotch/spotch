class CreateCircleEventTalks < ActiveRecord::Migration
  def change
    create_table :circle_event_talks do |t|

      t.integer :circle_event_id
      t.integer :user_id
      t.text :body
      t.timestamps 
    end
  end
end
