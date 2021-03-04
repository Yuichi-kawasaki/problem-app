FactoryBot.define do
  factory :user do
    name { 'テスト' }
    email { 'test@test.com' }
    password { '11111111' }
    admin { false }
  end
  factory :second_user, class: User do
    name { 'テスト1' }
    email { 'test1@test.com' }
    password { '22222222' }
    admin { false }
  end
  # factory :admin_user, class: User do
  #   name { 'admin' }
  #   email { 'admin@admin.com' }
  #   password { '00000000' }
  #   admin { true }
  # end
end
