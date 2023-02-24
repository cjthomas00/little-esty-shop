class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  enum status: ["pending", "packed", "shipped"]
end