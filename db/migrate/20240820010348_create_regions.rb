class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table "regions", force: :cascade do |t|
      t.string :name, null: false
      t.integer :sakenowaId, null: false

      t.timestamps
    end
  end
end
