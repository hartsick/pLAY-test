class AddTimestampToRouteStops < ActiveRecord::Migration
  def change
  	add_column :route_stops, :created_at, :datetime
  	add_column :route_stops, :updated_at, :datetime
  end
end
