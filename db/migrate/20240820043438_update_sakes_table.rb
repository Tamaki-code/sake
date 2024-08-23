class UpdateSakesTable < ActiveRecord::Migration[7.0]
  def change
    # "prefecture"と"brewery"カラムを削除
    remove_column :sakes, :prefecture, :string
    remove_column :sakes, :brewery, :string

    # "brand"カラムを"name"に名前変更
    rename_column :sakes, :brand, :name

    # "brewery_id"カラムを追加
    add_column :sakes, :brewery_id, :integer

    # 外部キー制約を追加する
    add_foreign_key :sakes, :breweries, column: :brewery_id
  end
end
