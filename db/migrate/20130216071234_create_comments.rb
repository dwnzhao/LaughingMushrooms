class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :author, :class_name => "User", :foreign_key => "user_id"
      t.references :post
      t.text :content
      t.string :author_name

      t.timestamps
    end
  end
end
