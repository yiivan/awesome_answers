# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do
  Question.create title:      Faker::Company.bs,
                  body:       Faker::Lorem.paragraph,
                  view_count: 0
end

puts Cowsay.say("Generated a 100 questions!")

50.times do
  Student.create first_name: Faker::Name.first_name,
                 last_name:  Faker::Name.last_name,
                 email:      Faker::Internet.email
end

100.times do
  q = Question.create title:      Faker::Company.bs,
                      body:       Faker::Lorem.paragraph,
                      view_count: 0
  10.times do
    random = rand(20)
    if random < 10
      q.answers.create(body: Faker::StarWars.quote)
    else
      q.answers.create(body: Faker::ChuckNorris.fact)
    end
  end
end

10.times do
  Category.create(name: Faker::Hacker.adjective)
end
