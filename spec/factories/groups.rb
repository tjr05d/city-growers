require 'faker'

FactoryGirl.define do
  factory :group do
    sequence(:name)           { |n| Faker::Team.name }
    sequence(:city)           { |n| Faker::Address.city }
    sequence(:description)    { |n| Faker::Lorem.sentences(3) }
  end
end
