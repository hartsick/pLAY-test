class CreateStopRaws < ActiveRecord::Migration
  def change
    create_table :stop_raws do |t|
      t.integer :stop_id
      t.integer :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.float :stop_lat
      t.float :stop_lon
      t.string :stop_url
      t.integer :location_type
      t.integer :parent_station
      t.string :tpis_name

      t.timestamps
    end
  end
end
