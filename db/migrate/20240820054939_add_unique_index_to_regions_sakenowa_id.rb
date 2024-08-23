class AddUniqueIndexToRegionsSakenowaId < ActiveRecord::Migration[7.0]
  def change
    # sakenowaId カラムに一意のインデックスを追加
    add_index :regions, :sakenowaId, unique: true
  end
end
