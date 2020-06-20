require 'pry'
howard = User.create(name: "Howard", email: "howard@howard.com", password: "password")
sherry = User.create(name: "Sherry", email: "sherry@sherry.com", password: "password")

Epiphany.create(content: "Today is Tuesday and it's great!", user_id: howard.id)
