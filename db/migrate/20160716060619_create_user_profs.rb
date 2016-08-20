class CreateUserProfs < ActiveRecord::Migration
  def change
    create_table :user_profs do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.string :sex
      t.string :birthplace
      t.string :location
      t.string :experience_sports
      t.string :charenge_sports
      t.string :foot
      t.string :hand
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
