require 'factory_girl_rails'

User.destroy_all
Group.destroy_all
puts "Destroying all users and groups"

puts "Creating 10 users"
10.times {FactoryGirl.create :user}

puts "Creating 5 groups"
5.times {FactoryGirl.create :group}

puts "Creating 15 products"
15.times {FactoryGirl.create :product}
