# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying old records"
Task.destroy_all
Status.destroy_all
Board.destroy_all
User.destroy_all

puts "Seeding started"
puts "Creating DB"

user = User.create(username: "User1",
                   email: "User1@test.com",
                   password: "password")

board = user.boards.create(
  project: "project1",
)

status = board.statuses.create(
  column: "TODO",
)

task = status.tasks.create(

  title: "create user stories",
  description: "lorem ipsum dolor sit amet",
)

task = status.tasks.create(

  title: "make ERD",
  description: "lorem ipsum dolor sit amet",
)

task = status.tasks.create(

  title: "wireframes",
  description: "lorem ipsum dolor sit amet",
)

status = board.statuses.create(
  column: "DOING",
)
status = board.statuses.create(
  column: "DONE",
)

puts "Seeding complete"
