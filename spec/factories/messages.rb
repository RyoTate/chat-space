FactoryGirl.define do
  factory :message do
    body       { Faker::Lorem.sentence }
    created_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
    group_id   1
    user_id    1
  end
end
