require 'faker'

FactoryGirl.define do
  factory :product do
    name "Strawberries"
    grow_rate "300 per/mo"
    price 200
    association :user, factory: :user
  end
end
