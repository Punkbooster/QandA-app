# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.destroy_all
Question.destroy_all
User.destroy_all

User.create!([
  { id: 1, email: 'client@gmail.com', password: '1234test', password_confirmation: '1234test' },
  { id: 2, email: 'me@gmail.com', password: '1234test', password_confirmation: '1234test' }
  ])

Event.create!([
  { id: 1, user_id: 1, title: "That's extremely cool event.", description: "Slow-carb sustainable hoodie, marfa chambray green juice kitsch try-hard waistcoat fingerstache. Farm-to-table +1 polaroid you probably haven't heard of them master cleanse. Etsy kogi pickled leggings. Chillwave green juice slow-carb ethical freegan direct trade. Sartorial ramps vinyl, bespoke fanny pack occupy banjo. Try-hard keffiyeh ramps, next level cliche locavore tote bag meditation fingerstache pug biodiesel bitters actually flannel."
  },
  { id: 2, user_id: 1, title: "Sample event", description: "Lo-fi umami tacos, scenester chartreuse humblebrag put a bird on it cardigan green juice pitchfork cred pop-up freegan offal."
  }
  ])

Question.create!([
  { id: 1, event_id: 1, content: "Whata heck was that?", user_id: 1 },
  { id: 2, event_id: 1, content: "Is it a perspective idea?", user_id: 2 }
  ])

p "Created #{User.count} users"
p "Created #{Event.count} events"
p "Created #{Question.count} questions"
