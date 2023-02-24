class Merchant < ApplicationRecord
  has_many :items

  enum status: ["Enabled", "Disabled"]
end