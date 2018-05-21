class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string "nick" , :limit=>20 , :null => false
      t.string "email" , :limit=>20 , :null => false
      t.integer "hp" , :null => false, :default => 100
      t.integer "lvl" , :null => false,  :default => 1
      t.integer "experience" , :null => false,  :default => 0
      t.integer "gold" , :null => false,  :default => 0
      t.integer "attack" , :null => false, :default => 10
      t.integer "defence" , :null => false, :default => 5
      t.integer "strength" , :null => false,  :default => 10
      t.integer "agility" , :null => false,  :default => 10
      t.timestamps
    end
    add_index("users","nick")
  end

  def down
    drop_table :users
  end
end
