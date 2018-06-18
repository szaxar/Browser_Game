class AddGuildToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :guild, :string
    add_reference :users, :guilde, foreign_key: true
  end
end
