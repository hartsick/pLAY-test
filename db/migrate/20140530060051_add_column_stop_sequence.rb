class AddColumnStopSequence < ActiveRecord::Migration
  def change
  	add_column :route_stops, :stop_sequence, :integer
  end
end
