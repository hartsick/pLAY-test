class ChangeColumnFormatsForTrips < ActiveRecord::Migration
  def change
	  change_column :trip_raws, :route_id, :string
	  change_column :trip_raws, :service_id, :string
  end
end
