class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :route_id
      t.string :route_short_name
      t.string :route_long_name
      t.string :route_desc

      t.timestamps
    end
  end
end
