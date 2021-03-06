votes = [1, -1]

User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

10.times do
  username = Faker::Pokemon.name.downcase
  u = User.create(username: username , email: Faker::Internet.email(username))
  q = Question.create(title: Faker::RickAndMorty.quote, content: Faker::Hipster.paragraph, questioner_id: u.id)
  Answer.create(content: Faker::ChuckNorris.fact, question_id: q.id, answerer_id: u.id)
  Vote.create(votable_type: Question, votable_id: q.id, voter_id: u.id, value: votes.sample)
  Vote.create(votable_type: Answer, votable_id: q.id, voter_id: u.id, value: votes.sample)
  Comment.create(commentable_type: Question, commentable_id: q.id, commenter_id: u.id, content: Faker::MostInterestingManInTheWorld.quote)
  Comment.create(commentable_type: Answer, commentable_id: q.id, commenter_id: u.id, content: Faker::MostInterestingManInTheWorld.quote)
end
