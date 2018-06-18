class CreateGuildes < ActiveRecord::Migration[5.2]
  def change
    create_table :guildes do |t|
      t.string :name
      t.integer :max_members

      t.timestamps
    end
  end
end
