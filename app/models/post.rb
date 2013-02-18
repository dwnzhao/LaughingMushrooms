class Post < ActiveRecord::Base
  attr_accessible :header, :body, :url, :creator_id, :archived, :liked
  
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :users
  has_many :comments, :dependent => :destroy 
end
