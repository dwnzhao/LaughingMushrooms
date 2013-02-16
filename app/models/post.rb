class Post < ActiveRecord::Base
  attr_accessible :header, :body, :url, :creator_id, :archived
  
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :users

end
