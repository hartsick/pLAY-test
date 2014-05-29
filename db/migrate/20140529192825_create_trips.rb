class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :rapper, index: true
      t.integer :dep_id
      t.integer :arr_id

      t.timestamps
    end
  end
end
