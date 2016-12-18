require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:first_name)  { |n| Faker::Name.first_name + n.to_s }
    sequence(:last_name)   { |n| Faker::Name.last_name + n.to_s }
    sequence(:email)       { |n| Faker::Internet.email }
    sequence(:password)    { |n| Faker::Internet.password }
    sequence(:city)        { |n| Faker::Address.zip }
    sequence(:avatar)      { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
  end
end
