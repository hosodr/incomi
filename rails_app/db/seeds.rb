# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!( name:'Yamada', email:'yamada@mail.com', password:'aiueo12345')
user2 = User.create!( name:'John', email:'john@mail.com', password:'aiueo6789')
user3 = User.create!( name:'Sato', email:'sato@mail.com', password:'satodesuyo')
user4 = User.create!( name:'Matsumoto', email:'matsumoto@mail.com', password:'futon-masao')

channel1 = Channel.create!(name:"Machine Learning", abstract:'for beginner')
channel2 = Channel.create!(name:"Statistics", abstract:'for beginner')

event1 = Event.create!(channel_id:1,host_user_id:1 ,name:'GAN')
event2 = Event.create!(channel_id:1,host_user_id:2 ,name:'How to use R')

comment1 = Comment.create!(user_id:1, channel_id:1)
comment2 = Comment.create!(user_id:2, channel_id:2)
comment3 = Comment.create!(user_id:3, channel_id:2)

participation1 = Participation.create!(user_id:1,event_id:1)
