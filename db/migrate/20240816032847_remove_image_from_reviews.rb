class RemoveImageFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :image, :string
  end
end
