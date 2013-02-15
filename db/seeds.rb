reader1 = User.create!(email: "dawnzhao@outlook.com", password: "mushrooms", first_name: "dawn", last_name: "zhao")
creator1 = User.create!(email: "dwnzhao@gmail.com", password: "mushrooms", first_name: "dawn", last_name: "zhao")

Post.create!(archived: "fasle", header: "read this", body: "hello", url: "http://www.google.com", creator_id: creator1.id, reader_id: reader1.id)
Post.create!(archived: "fasle", header: "read this", body: "yes", url: "http://www.google.com", creator_id: creator1.id, reader_id: reader1.id)
Post.create!(archived: "fasle", header: "read this", body: "believe", url: "http://www.google.com", creator_id: creator1.id, reader_id: reader1.id)
Post.create!(archived: "fasle", header: "read this", body: "see", url: "http://www.google.com", creator_id: creator1.id, reader_id: reader1.id)
Post.create!(archived: "fasle", header: "read this", body: "plus", url: "http://www.google.com", creator_id: creator1.id, reader_id: reader1.id)
Post.create!(archived: "fasle", header: "read this", body: "haha", url: "http://www.google.com", creator_id: creator1.id, reader_id: reader1.id)

