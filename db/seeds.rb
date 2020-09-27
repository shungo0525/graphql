# Post.new.tap do |post|
#   post.title = 'title'
#   post.description = 'description'
#   post.comments.build(content:'comment1')
#   post.save!
# end

20.times do |n|
  Post.create!(
    title: "title#{n}",
    description: "description#{n}"
  )
end

# post = Post.order(:created_at).take(5)
# 5.times do |n|
#   post.comments.build(content: "comment#{n}")
#   post.save!
# end

5.times do |n|
  post = Post.find(n+1)
  5.times do |m|
    post.comments.build(content: "comment#{n}-#{m}")
    post.save!
  end
end

# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.microposts.create!(content: content) }
# end
