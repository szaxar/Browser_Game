class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.string :attacker
      t.string :defender
      t.string :winner
      t.datetime :date
      t.integer :gold

      t.timestamps
    end
    add_reference :users,:attacker
    add_reference :users,:defender
  end
end
