class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice
  has_one :merchant, through: :item
  has_one :customer, through: :invoice

  validates_presence_of :quantity, :unit_price
  validates :quantity, :unit_price, numericality: {greater_than_or_equal_to: 0}
  enum status: ["pending", "packaged", "shipped"]

  def self.top_sales_date
    select('invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue')
    .joins(:transactions)
    .where(transactions: {result: :success})
    .group('invoices.id')
    .order('total_revenue desc, invoices.created_at desc')
    .first
    .created_at
  end
end