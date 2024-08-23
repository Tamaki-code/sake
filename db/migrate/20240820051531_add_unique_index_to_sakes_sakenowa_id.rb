class AddUniqueIndexToSakesSakenowaId < ActiveRecord::Migration[7.0]
  def change
    # sakenowaIdに一意のインデックスを追加
    add_index :sakes, :sakenowaId, unique: true
  end
end
