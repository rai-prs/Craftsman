FactoryBot.define do
  factory :user do
    name                  { 'Taro' }
    email                 { Faker::Internet.free_email }
    password              { 'aaBB-1234' }
    password_confirmation { password }
  end
end
