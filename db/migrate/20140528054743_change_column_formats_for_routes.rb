class ChangeColumnFormatsForRoutes < ActiveRecord::Migration
  def change
	  change_column :route_raws, :route_id, :string
  end
end
