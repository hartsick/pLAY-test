class CreateRouteStops < ActiveRecord::Migration
  def change
    create_table :route_stops do |t|
      t.references :route, index: true
      t.references :stop, index: true
      t.integer :stop_sequence
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
