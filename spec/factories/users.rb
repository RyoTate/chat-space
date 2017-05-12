FactoryGirl.define do
  factory :user do
    id '1'
    name     { Faker::Name.name }
    email    { Faker::Internet.email }
    password '000000'
    password_confirmation '000000'
  end
end
