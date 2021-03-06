class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :limit => 25
      t.string :last_name, :limit => 50
      t.string :email, :default =>'', :null => false
      t.boolean :email_confirmed, :default => false 
      t.string :hashed_password
      t.string :salt
      t.integer :user_level, :limit =>3, :default => 1
      t.attachment :avatar

      t.timestamps
    end
  end
end
