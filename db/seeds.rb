# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Content.create(title: 'uncategorized', category: 0)
Content.create(title: 'book', category: 1)
Content.create(title: 'game', category: 2)
Content.create(title: 'movie', category: 3)
Content.create(title: 'tv_programming', category: 4)
