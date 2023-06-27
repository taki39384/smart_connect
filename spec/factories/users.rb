FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
