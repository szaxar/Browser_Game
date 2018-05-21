# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_21_180942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"

  create_table "expeditions", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.integer "requiredLevel"
    t.integer "gainedExperience"
    t.integer "gainedGold"
    t.integer "enemyAttack"
    t.integer "enemyDefence"
    t.integer "enemyStrength"
    t.integer "enemyAgility"
    t.integer "enemyHp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.string "nick"
    t.string "email"
    t.integer "hp"
    t.integer "lvl"
    t.integer "experience"
    t.integer "gold"
    t.integer "attack"
    t.integer "defence"
    t.integer "strength"
    t.integer "agility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
