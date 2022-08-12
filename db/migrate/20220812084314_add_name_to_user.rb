class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_index :users, :name, unique: true
  end
end
