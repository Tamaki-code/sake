class ChangeSakenowaIdToBeIntegerInRegions2 < ActiveRecord::Migration[7.0]
  def change
    change_column :regions, :sakenowaId, :string
  end
end
