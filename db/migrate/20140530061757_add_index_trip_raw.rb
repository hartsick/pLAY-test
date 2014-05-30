class AddIndexTripRaw < ActiveRecord::Migration
  def change
  	add_index :trip_raws, :route_id
  end
end
