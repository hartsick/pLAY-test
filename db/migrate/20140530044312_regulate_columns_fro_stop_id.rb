class RegulateColumnsFroStopId < ActiveRecord::Migration
  def change
	  change_column :route_stops, :stop_id, :string
  end
end
