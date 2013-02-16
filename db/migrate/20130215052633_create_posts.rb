class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :creator, :class_name => "User", :foreign_key => "user_id"
      t.string :header
      t.string :body
      t.string :url
      t.boolean :archived, :null => false, :default => 0

      t.timestamps
    end
  end
  
  create_table :posts_users, :id => false do |t|
    t.integer :user_id
    t.integer :post_id
  end
  
  add_index :posts_users, ['user_id', 'post_id']
  
  
  
end
