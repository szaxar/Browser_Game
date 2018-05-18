class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
        t.string "nick" , :limit=>20 , :null => false
        t.string "email" , :limit=>20 , :null => false
        t.string "password_digest" , :limit=> 20 , :null => false
        t.integer "hp" , :null => false
        t.integer "lvl" , :null => false
        t.integer "experience" , :null => false
        t.integer "attack" , :null => false
        t.integer "defence" , :null => false
        t.integer "strength" , :null => false
        t.integer "agility" , :null => false
        #TODO item list
      t.timestamps
    end
    add_index("users","nick")
  end


  def down
    drop_table :users
  end
end
