class CreateCircleTalks < ActiveRecord::Migration
  def change
    create_table :circle_talks do |t|

      t.integer :circle_id
      t.integer :user_id
      t.text :body
      t.timestamps 
    end
  end
end
