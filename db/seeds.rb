# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Admin account
User.create(email: 'admin@example.com', name: 'admin', password: 'password1', password_confirmation: 'password1')

# Dummy data
15.times do
    password = Faker::Lorem.characters(8)
    user = User.create(email: Faker::Internet.email, name: Faker::Name.name, password: password, password_confirmation: password)
    2.times do
        user.posts.build(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(2), link: Faker::Internet.url).save!
    end
end
