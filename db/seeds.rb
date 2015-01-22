require 'faker'

#create users
5.times do 
  user = User.new(
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end

users = User.all
lists = List.all


#create items
20.times do
  Item.create!(
    list: lists.sample,
    name: Faker::Lorem.sentence
  )
end


#Adding test users
#Test Admin User
admin = User.new(
  email:      'admin@example.com',
  password:   'testtest',
)
admin.skip_confirmation!
admin.save!


puts "#{User.first.email} 1st email"
puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
