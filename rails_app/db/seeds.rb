# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!( name:'Yamada', email:'yamada@mail.com', password_digest:'yamayama')

channel1 = Channel.create!(name:"Machine Learning", abstract:'for beginner')

event1 = Event.create!(channel_id:1,host_user_id:1 ,name:'GAN')

comment1 = Comment.create!(user_id:1, channel_id:1)

participation1 = Participation.create!(user_id:1,event_id:1)
