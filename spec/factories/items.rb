FactoryBot.define do
  factory :item do
    genre_id { 2 }
    name { "コールマンツーリングドーム" }
    feature { "初心者から上級者まで幅広い人気" }
    price { 12500 }
    association :user
  end
end
