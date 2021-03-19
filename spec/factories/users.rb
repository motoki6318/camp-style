FactoryBot.define do
  factory :user do
    nickname {"キャンプマン"}
    email {Faker::Internet.free_email}
    password {"test123"}
    password_confirmation {password}
  end
  
end
