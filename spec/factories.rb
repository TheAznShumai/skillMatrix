RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| 'userTest#{n}@test.com' }
    sequence(:username) { |n| 'username#{n}' }
    password '1qaz2wsx3edc'
    password_confirmation '1qaz2wsx3edc'
    admin true
  end

  factory :profile do
    first_name 'test'
    last_name 'user'
  end
end

