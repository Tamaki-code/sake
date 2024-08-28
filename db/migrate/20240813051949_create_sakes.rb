class CreateSakes < ActiveRecord::Migration[7.0]
  def change
    create_table :sakes do |t|
      t.integer :sakenowaId
      t.string :brand
      t.string :brewery
      t.string :prefecture

      t.timestamps
    end
  end
end
