class CreateRouteStops < ActiveRecord::Migration
  def change
    create_table :route_stops do |t|
      t.string :route_id
      t.integer :direction_id
      t.string :stop_id
      t.integer :stop_order

      t.timestamps
    end
  end
end
