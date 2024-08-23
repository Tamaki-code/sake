class UpdateSakesTabl2e < ActiveRecord::Migration[7.0]
  def change
    change_column :sakes, :sakenowaId, :integer
  end
end
