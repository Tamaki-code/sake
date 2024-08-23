class AddSakenowaIdToRegions < ActiveRecord::Migration[7.0]
  def change
    add_column :regions, :sakenowaId, :string, null: false
  end
end
