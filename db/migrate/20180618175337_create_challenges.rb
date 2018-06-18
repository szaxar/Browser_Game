class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :attacker
      t.string :defender
      t.string :winner
      t.timestamp :date
      t.integer :gold

      t.timestamps
    end
  end
end
