FactoryBot.define do
  factory :post do
    association :user
    title { "title" }
    description { "description" }
  end
end
