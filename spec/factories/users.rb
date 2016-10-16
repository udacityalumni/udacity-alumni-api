FactoryGirl.define do
  factory :user do
    name                  FFaker::Name.name
    sequence(:email)      { |n| "user#{n}@example.com"}
    password              'password'
    password_confirmation 'password'
    role                  'admin'
    bio                   'Hello world'
    avatar                'http://github.com/RyanCCollins.png'
  end
end
