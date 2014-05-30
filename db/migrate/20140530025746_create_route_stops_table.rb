class CreateRouteStopsTable < ActiveRecord::Migration
  def change
    create_table :route_stops_tables do |t|
      t.references :route, index: true
      t.references :stop, index: true
    end
  end
end
