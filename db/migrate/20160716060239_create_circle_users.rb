class CreateCircleUsers < ActiveRecord::Migration
  def change
    create_table :circle_users do |t|

      t.string :circle_id
      t.string :user_id

      t.timestamps 
    end
  end
end
