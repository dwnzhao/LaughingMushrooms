class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :reader, :class_name => "User", :foreign_key => "user_id"
      t.references :creator, :class_name => "User", :foreign_key => "user_id"
      t.string :header
      t.string :body
      t.string :url
      t.boolean :archived, :null => false, :default => 0

      t.timestamps
    end
  end
end
