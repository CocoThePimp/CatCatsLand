# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
20.times do
   items =  Item.create(title: Faker::Creature::Cat.name, description: Faker::Lorem.paragraph, price: Faker::Number.decimal(2), image_url: 'image_url')
end
