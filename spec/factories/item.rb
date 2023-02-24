FactoryBot.define do 
  factory :item do 
    sequence(:id)
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 3) }
    unit_price { Faker::Number.between(from: 1, to: 5000) }
    
    association :merchant
  end
end
