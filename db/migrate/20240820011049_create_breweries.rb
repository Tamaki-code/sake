class CreateBreweries < ActiveRecord::Migration[7.0]
  def change
    create_table "breweries", force: :cascade do |t|
      t.string :name, null: false
      t.string :sakenowa_brewery_id, unique: true
      t.references :region, null: false, foreign_key: true
      t.string :address
      t.string :website

      t.timestamps
    end
    add_index :breweries, :sakenowa_brewery_id, unique: true
  end
end
