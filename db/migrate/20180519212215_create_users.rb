class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :nick , :limit=>20 , :null => true, :unique => true
      t.string :email, :limit=>20 , :null => true, :unique => true
      t.integer :hp, :default => 100
      t.integer :lvl, :default => 1
      t.integer :experience , :default => 0
      t.integer :gold, :default => 0
      t.integer :attack, :default => 10
      t.integer :defence, :default => 5
      t.integer :strength,  :default => 10
      t.integer :agility,  :default => 10
      t.timestamps
    end
    add_index("users","nick")
  end

  def down
    drop_table :users
  end
end
