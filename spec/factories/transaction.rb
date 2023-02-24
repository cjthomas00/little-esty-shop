FactoryBot.define do 
  factory :transaction do 
    credit_card_number { Faker::Number.number(digits: 10).to_s }
    credit_card_expiration_date { nil }
    result { [0, 1].sample }
    invoice 
  end
end