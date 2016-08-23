class CreateCircleLikes < ActiveRecord::Migration
  def change
    create_table :circle_likes do |t|

      t.integer :circle_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
