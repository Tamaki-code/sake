class ModifyReviewColumns < ActiveRecord::Migration[6.0]
  def change
    # 既存のカラムを削除
    remove_column :reviews, :sweetness, :decimal
    remove_column :reviews, :spiciness, :decimal
    remove_column :reviews, :lightness, :decimal
    remove_column :reviews, :richness, :decimal

    # 新しいカラムを追加
    add_column :reviews, :f1, :float
    add_column :reviews, :f2, :float
    add_column :reviews, :f3, :float
    add_column :reviews, :f4, :float
    add_column :reviews, :f5, :float
    add_column :reviews, :f6, :float
  end
end
