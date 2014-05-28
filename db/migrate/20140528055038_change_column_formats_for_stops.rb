class ChangeColumnFormatsForStops < ActiveRecord::Migration
  def change
	  change_column :stop_raws, :stop_id, :string
	  change_column :stop_raws, :stop_code, :string
  end
end
