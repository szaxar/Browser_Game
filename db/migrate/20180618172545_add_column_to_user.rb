class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :busy_to, :timestamp
  end
end
