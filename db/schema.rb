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

ActiveRecord::Schema.define(version: 2018_06_18_175337) do

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
  enable_extension "plv8"
  enable_extension "sslinfo"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "challenges", force: :cascade do |t|
    t.string "attacker"
    t.string "defender"
    t.string "winner"
    t.datetime "date"
    t.integer "gold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expeditions", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.integer "requiredLevel"
    t.integer "gainedExperience", null: false
    t.integer "gainedGold", null: false
    t.integer "enemyAttack", null: false
    t.integer "enemyDefence", null: false
    t.integer "enemyStrength", null: false
    t.integer "enemyAgility", null: false
    t.integer "enemyHp", default: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_expeditions_on_name"
  end

  create_table "guildes", force: :cascade do |t|
    t.string "name"
    t.integer "max_members"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.string "nick", limit: 20
    t.string "email", limit: 20
    t.integer "hp", default: 100
    t.integer "lvl", default: 1
    t.integer "experience", default: 0
    t.integer "gold", default: 0
    t.integer "attack", default: 10
    t.integer "defence", default: 5
    t.integer "strength", default: 10
    t.integer "agility", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "guild"
    t.bigint "guilde_id"
    t.datetime "busy_to"
    t.index ["guilde_id"], name: "index_users_on_guilde_id"
    t.index ["nick"], name: "index_users_on_nick"
  end

  add_foreign_key "users", "guildes"
end
