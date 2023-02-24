FactoryBot.define do 
  factory :invoice_item do 
    quantity { Faker::Number.between(from: 1, to: 10) }
    unit_price { Faker::Number.between(from: 1, to: 5000) }
    status { [0, 1, 2].sample }
    association :item 
    association :invoice
  end
end