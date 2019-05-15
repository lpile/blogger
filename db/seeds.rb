# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.destroy_all

Article.create!(title: "Article 1", body: "Body 1")
Article.create!(title: "Article 2", body: "Body 2")
Article.create!(title: "Article 3", body: "Body 3")
Article.create!(title: "Article 4", body: "Body 4")
