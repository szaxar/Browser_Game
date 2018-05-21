class CreateExpeditions < ActiveRecord::Migration[5.2]
  def change
    create_table :expeditions do |t|
      t.string :name
      t.integer :duration
      t.integer :requiredLevel
      t.integer :gainedExperience
      t.integer :gainedGold
      t.integer :enemyAttack
      t.integer :enemyDefence
      t.integer :enemyStrength
      t.integer :enemyAgility
      t.integer :enemyHp

      t.timestamps
    end
  end
end
