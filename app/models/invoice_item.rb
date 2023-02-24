class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice
  has_one :merchant, through: :item
  has_one :customer, through: :invoice

  enum status: ["pending", "packed", "shipped"]
end