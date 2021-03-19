FactoryBot.define do
  factory :camp do
    title {'理想のキャンプ'}
    association :user
    # association :item
    # association :tag
  end
end