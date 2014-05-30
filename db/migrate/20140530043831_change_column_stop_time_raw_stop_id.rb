class ChangeColumnStopTimeRawStopId < ActiveRecord::Migration
  def change
	  change_column :stop_time_raws, :stop_id, :string
  end
end
