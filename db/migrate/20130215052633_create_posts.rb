class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :creator, :class_name => "User", :foreign_key => "user_id"
      t.string :header
      t.string :body
      t.string :url
      t.boolean :archived, :null => false, :default => 0
      t.boolean :liked, :null => false, :default => 0

      t.timestamps
    end
  end
  
  create_table :posts_users, :id => false do |t|
    t.references :user
    t.references :post
  end
  
  add_index :posts_users, ['user_id', 'post_id']
  
  
  
end
