class ChangeSakenowaIdToBeIntegerInRegions < ActiveRecord::Migration[7.0]
  def change
    change_column :regions, :sakenowaId, :integer, using: 'sakenowaId::integer'
  end
end
