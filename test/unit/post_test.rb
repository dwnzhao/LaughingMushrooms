require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def test_user_post_association
    creator = User.create!(email: "a@gmail.com", password: "mushrooms", first_name: "dawn", last_name: "zhao")
    post = Post.create!(archived: "false", header: "read this", body: "test", url: "http://www.google.com", creator_id: creator.id)
    reader = User.create!(email: "b@gmail.com", password: "mushrooms", first_name: "dawn", last_name: "zhao")
    post.creator_id = creator.id
    post.users << reader
    assert_equal post.id, reader.posts[0].id
  end  

end
