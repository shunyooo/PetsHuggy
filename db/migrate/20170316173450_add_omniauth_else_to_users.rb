class AddOmniauthElseToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :name, :string
  end
end
