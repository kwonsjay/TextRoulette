class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.integer :phone, :null => false
    	t.string :gender
    	t.integer :zip_code
    	t.date :birthday
    	t.boolean :nsfw, :default => false
    	t.boolean :looking_for_pairs, :default => false
      t.string :password_digest, :null => false

      t.timestamps
    end

    add_index :users, :phone, :unique => true
  end
end
