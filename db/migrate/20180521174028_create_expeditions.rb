class CreateExpeditions < ActiveRecord::Migration[5.2]
  def change
    create_table :expeditions do |t|
      t.string :name
      t.integer :duration
      t.integer :requiredLevel
      t.integer :gainedExperience, :null => false
      t.integer :gainedGold, :null => false
      t.integer :enemyAttack, :null => false
      t.integer :enemyDefence, :null => false
      t.integer :enemyStrength, :null => false
      t.integer :enemyAgility, :null => false
      t.integer :enemyHp, :null => false, :default => 100
      t.timestamps
    end
    add_index("expeditions","name")
  end

  def down
    drop_table :expeditions
  end
end