class AddMinisteridToCircleEvent < ActiveRecord::Migration
  def change
  	add_column :circle_events,:author_id,:integer
  end
end
