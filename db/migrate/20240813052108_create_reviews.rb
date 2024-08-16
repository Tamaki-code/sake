class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sake, null: false, foreign_key: true
      t.integer :rating
      t.decimal :sweetness
      t.decimal :spiciness
      t.decimal :lightness
      t.decimal :richness
      t.string :aroma
      t.string :aftertaste
      t.string :drinking_style
      t.string :matching_food
      t.text :comment
      t.string :image
      t.date :recorded_at

      t.timestamps
    end
  end
end
