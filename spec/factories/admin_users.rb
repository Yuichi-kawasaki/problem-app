FactoryBot.define do
  factory :admin_user  do
    # pass = Faker::Internet.password(min_length: 8)
    email                 { 'aaa@gmail.com' }
    password              { '123456' }
    password_confirmation { '123456' }
  end
end
