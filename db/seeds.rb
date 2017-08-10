# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FoodDiary.delete_all #clean all records
25.times do |i|
   FoodDiary.create!(
       name: Faker::Food.dish,
       no_of_servings: (0..9).to_a.sample,
       cal_per_servings:(10..500).to_a.sample,
       category: ['lunch','dinner', 'breakfast'].sample,
       date_consumed: Faker::Date.forward(90)
       )
end
