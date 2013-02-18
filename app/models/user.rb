class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :avatar, :password, :password_confirmation, :terms_and_conditions
  attr_accessor :terms_and_conditions, :password

  EMAIL_REGEX = /^[A-Z0-9._%+_]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :first_name, :presence => {:message => 'is required'}, :length => {:maximum => 25}
  validates :last_name, :presence => {:message => 'is required'}, :length => {:maximum => 25}
  validates :email, :uniqueness => true, :presence => {:message => 'is required'}, :length => {:maximum => 35}, :format => {:with => EMAIL_REGEX, :on => :save}  
  validates :password, :confirmation => true
  validates_acceptance_of :terms_and_conditions
  validates_length_of :password, :within => 5..25, :on => :create

  has_attached_file :avatar, :styles => { :medium => '300x300>', :thumb => '100x100>' }
  has_many :created_posts, :class_name => 'Post', :foreign_key => 'creator_id', :order => 'updated_at DESC', :dependent => :destroy 
  has_many :comments, :class_name => 'Comment', :foreign_key => 'author_id', :order => 'updated_at DESC', :dependent => :destroy 
  has_and_belongs_to_many :posts
  
  
  before_save :create_hashed_password
  after_save :clear_password

  def fullname
    name = first_name + ' ' + last_name
    return name
  end

  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end

  def self.authorize(email="", user_input_password="")
    user = User.find_by_email(email)
    if user && user.password_match?(user_input_password)
      return user
    else
      return false
    end
  end


  private

  def self.make_salt(email="")
    Digest::SHA1.hexdigest("time #{email} is #{Time.now} precious")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end


  def create_hashed_password
    unless password.blank?
      self.salt = User.make_salt(email) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end

