class CreateCircleEventTickets < ActiveRecord::Migration
  def change
    create_table :circle_event_tickets do |t|

      t.integer :circle_event_id
      t.integer :user_id
      t.boolean :confirm 

      t.timestamps 
    end
  end
end
