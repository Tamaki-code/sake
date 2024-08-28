class CreateFlavorCharts < ActiveRecord::Migration[7.0]
  def change
    create_table :flavor_charts do |t|
      t.integer :sakenowaBrandId
      t.float :f1
      t.float :f2
      t.float :f3
      t.float :f4
      t.float :f5
      t.float :f6

      t.timestamps
    end
  end
end
