# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!( name:'Yamada', email:'yamada@mail.com', password_digest:'yamayama')
user2 = User.create!( name:'John', email:'john@mail.com', password_digest:'jjj')
user3 = User.create!( name:'Sato', email:'sato@mail.com', password_digest:'satosato')
user4 = User.create!( name:'Matsumoto', email:'matsumoto@mail.com', password_digest:'aaa')
user5 = User.create!( name:'Bob', email:'bob@mail.com', password_digest:'bobbob')

channel1 = Channel.create!(name:"Machine Learning", abstract:'for beginner')
channel2 = Channel.create!(name:"Statistics", abstract:'for beginner')
channel3 = Channel.create!(name:"Tour of GO", abstract:'I fully understood golang')
channel4 = Channel.create!(name:"What is gRPC?", abstract:'tell me what gRPC is.')
channel5 = Channel.create!(name:"Let's study JavaScript", abstract:'I cannot understand Javascript')
channel6 = Channel.create!(name:"Java", abstract:'basic')
channel7 = Channel.create!(name:"framework", abstract:'advanced')

event1 = Event.create!(channel_id:1,host_user_id:4 ,name:'GAN')
event2 = Event.create!(channel_id:1,host_user_id:2 ,name:'How to use R')
event3 = Event.create!(channel_id:3,host_user_id:5 ,name:'live coding on tour of Go')

comment1 = Comment.create!(user_id:1, channel_id:1, message: 'I wanna learn about ML')
comment2 = Comment.create!(user_id:4, channel_id:1, message: 'See this twitter: https://twitter.com/ak92501')
channel5 = Channel.create!(parent_channel_id:1, parent_comment_id:2)
comment3 = Comment.create!(user_id:1, channel_id:5, message: "what's this?")
comment4 = Comment.create!(user_id:4, channel_id:5, message: "I've created event")
comment5 = Comment.create!(user_id:5, channel_id:8, message: 'Twitter!?')
comment6 = Comment.create!(user_id:2, channel_id:3, message: 'what is this topic?')
comment7 = Comment.create!(user_id:3, channel_id:3, message: 'this is your channel, right?')
comment8 = Comment.create!(user_id:1, channel_id:6, message: "I didn't understand today's class")
comment9 = Comment.create!(user_id:2, channel_id:6, message: "I lost my text book!")
comment10 = Comment.create!(user_id:3, channel_id:6, message: "I overslept and couldn't attend class.")

channel8 = Channel.create!(parent_channel_id:6, parent_comment_id:8)
comment11 = Comment.create!(user_id:3, channel_id:9, message: "Why don't you study at the study meeting?")
comment12 = Comment.create!(user_id:1, channel_id:9, message: "Yes!")
comment13 = Comment.create!(user_id:1, channel_id:6, message: "It was decided to hold the study meeting. Everyone is welcome to join us.")
comment14 = Comment.create!(user_id:5, channel_id:6, message: "If someone know the range of mid term exam, please tell me.")

channel9 = Channel.create!(parent_channel_id:6, parent_comment_id:14)
comment15 = Comment.create!(user_id:1, channel_id:10, message: "Maybe up to page 30")

event4 = Event.create!(channel_id:6,host_user_id:3 ,name:"Let's study Java!", abstract:"Studing Java", from_date:'2020-10-01', to_date:'2020-10-02')


participation1 = Participation.create!(user_id:1,event_id:1)
participation2 = Participation.create!(user_id:4,event_id:1)
# participation3 = Participation.create!(user_id:3,event_id:3)

