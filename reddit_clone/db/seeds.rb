# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [User.create(username: 'username', password: 'password')]

20.times {
  users << User.create(username: Faker::HarryPotter.character, password: 'passqword')
}

subs = []
10.times do |i|
  subs << Sub.create(title: "#{Faker::Hobbit.character}#{i}", description: Faker::Hacker.say_something_smart, moderator_id: 1)
end

posts = []
subs.each do |each_sub|
  possibilities = (1..10).to_a.shuffle
  sub_ids = [possibilities.pop, possibilities.pop, possibilities.pop]
  posts << Post.create(title: Faker::RickAndMorty.character, content: Faker::RickAndMorty.quote, url: 'http://google.com', author_id: 1, sub_ids: sub_ids )
end
j = 0
comments = []
posts.each do |post|

  40.times do |i|
    possibilities = []
    possibilities = ((40*j)+2..(40*j)+i).to_a if i > 3
    possibilities += [nil]
    comments << Comment.create(content: Faker::Friends.quote, author_id: users.sample.id, parent_comment_id: possibilities.sample, post_id: post.id)
  end

  j += 1
end

100.times {
  posts.sample.downvote(users.sample)
  posts.sample.upvote(users.sample)
}

2000.times {
  comments.sample.upvote(users.sample)
  comments.sample.downvote(users.sample)
}
