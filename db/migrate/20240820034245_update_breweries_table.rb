class UpdateBreweriesTable < ActiveRecord::Migration[7.0]
  def change
    # 不要なカラムを削除
    remove_column :breweries, :address, :string
    remove_column :breweries, :website, :string

    # 'sakenowa_brewery_id' を string から integer に変更
    change_column :breweries, :sakenowa_brewery_id, :integer

    # 'region_id' に外部キー制約を追加
    add_foreign_key :breweries, :regions
  end
end
