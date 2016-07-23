class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name
      t.string :image
      t.text :desc

      t.timestamps null: false
    end
  end
end
