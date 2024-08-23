class RemoveCountryFromRegions < ActiveRecord::Migration[7.0]
  def change
    remove_column :regions, :country, :string
  end
end
