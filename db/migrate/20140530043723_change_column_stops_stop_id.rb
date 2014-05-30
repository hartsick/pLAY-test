class ChangeColumnStopsStopId < ActiveRecord::Migration
  def change
	  change_column :stops, :stop_id, :string
  end
end
