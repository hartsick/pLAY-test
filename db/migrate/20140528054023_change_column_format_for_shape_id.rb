class ChangeColumnFormatForShapeId < ActiveRecord::Migration
  def change
	  change_column :trip_raws, :shape_id, :string
  end
end
