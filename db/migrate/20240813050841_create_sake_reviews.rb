class CreateSakeReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :sake_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bundle
      t.string :install

      t.timestamps
    end
  end
end
