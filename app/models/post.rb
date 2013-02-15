class Post < ActiveRecord::Base
  attr_accessible :header, :body, :url, :creator_id, :reader_id, :archived
  
  belongs_to :reader, :class_name => "User"
  belongs_to :creator, :class_name => "User"
end
