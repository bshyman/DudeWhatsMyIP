# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

6.times do 
	Interface.create(ip:Faker::Internet.ip_v4_address, hostname: Faker::Internet.domain_word, port: Faker::Number.number(4), ddns: Faker::Internet.url)
end