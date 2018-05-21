json.extract! expedition, :id, :name, :duration, :requiredLevel, :gainedExperience, :gainedGold, :enemyAttack, :enemyDefence, :enemyStrength, :enemyAgility, :enemyHp, :created_at, :updated_at
json.url expedition_url(expedition, format: :json)
