class Comment < ActiveRecord::Base
  attr_accessible :author_id, :content, :post_id, :author_name

  belongs_to :author, :class_name => "User"
  belongs_to :post


end
