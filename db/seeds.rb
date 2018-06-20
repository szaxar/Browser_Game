# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

expedition = Expedition.create([
    {name: 'Expediton for gold',
     duration: 10 ,
     requiredLevel: 1,
     gainedExperience: 20,
     gainedGold:1000,
     enemyAttack:10,
     enemyDefence:5,
     enemyStrength: 1,
     enemyAgility:20 ,
     enemyHp:100},
    {name: 'Experiencing expediton',
     duration: 10 ,
     requiredLevel: 1,
     gainedExperience: 200,
     gainedGold:10,
     enemyAttack:10,
     enemyDefence:5,
     enemyStrength: 1,
     enemyAgility:20 ,
     enemyHp:100},
    {name: 'Long expedtion',
     duration: 1000 ,
     requiredLevel: 1,
     gainedExperience: 2000,
     gainedGold:1000,
     enemyAttack:10,
     enemyDefence:5,
     enemyStrength: 1,
     enemyAgility:20 ,
     enemyHp:100},
                               ])
