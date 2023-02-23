class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :customers, through: :invoice

  validates_presence_of :credit_card_number
  enum result: [:success, :failed]
end