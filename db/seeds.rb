begin
  creator1 = User.find(1)
rescue
  creator1 = User.create!(email: "dwnzhao@gmail.com", password: "mushrooms", first_name: "dawn", last_name: "zhao")
end

Post.create!(archived: "false", header: "read this", body: "hello", url: "http://www.google.com", creator_id: creator1.id)
Post.create!(archived: "false", header: "read this", body: "yes", url: "http://www.google.com", creator_id: creator1.id)
Post.create!(archived: "false", header: "read this", body: "believe", url: "http://www.google.com", creator_id: creator1.id)
Post.create!(archived: "false", header: "read this", body: "see", url: "http://www.google.com", creator_id: creator1.id)
Post.create!(archived: "false", header: "read this", body: "plus", url: "http://www.google.com", creator_id: creator1.id)
Post.create!(archived: "false", header: "read this", body: "haha", url: "http://www.google.com", creator_id: creator1.id)

Comment.create!(content: "this is really cool", post_id: 1, author_id: creator1.id, author_name: "dawn")
