class AddIndexStopTimeRaw < ActiveRecord::Migration
  def change
  	add_index :stop_time_raws, :trip_id
  end
end
