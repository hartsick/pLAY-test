class ChangeColumnStopId < ActiveRecord::Migration
  def change
	  change_column :route_stops, :route_id, :string
  end
end
