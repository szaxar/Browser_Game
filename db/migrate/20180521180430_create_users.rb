class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :nick
      t.string :email
      t.integer :hp
      t.integer :lvl
      t.integer :experience
      t.integer :gold
      t.integer :attack
      t.integer :defence
      t.integer :strength
      t.integer :agility

      t.timestamps
    end
  end
end
