# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times{
  u = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    location: Faker::Address.city,
    state: Faker::Address.state_abbr,
    password: 'yakisoba',
    password_confirmation: 'yakisoba'
  )
  5.times{
    e = Event.create(
      name: Faker::Hipster.word,
      date: Faker::Date.forward(100),
      location: u.location,
      state: u.state,
      host: u
    )
    sleep(1/100)
  }
}

100.times{
  user_id = User.pluck(:id).shuffle.first
  u = User.find_by(id: user_id)
  event_id = Event.pluck(:id).shuffle.first
  e = Event.find_by(id: event_id)
  a = Attend.create(
     user: u,
     event: e
  )
  sleep 1/100
  3.times{
    c = Comment.create(
      user: u,
      event: e,
      comment: Faker::Hipster.sentence
    )
    sleep 2/100
  }
}
