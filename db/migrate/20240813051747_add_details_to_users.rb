class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :birthdate, :date
    add_column :users, :comment, :text
  end
end
