class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  validates_presence_of :name, :description
  validates :unit_price, numericality: { greater_than_or_equal_to: 0}

  enum status: ["Disabled", "Enabled"]

  def self.ready_to_ship(merchant_id)
    joins(invoice_items: :invoice)
    .select('items.*,invoice_items.id as inv_item_id, invoices.id as inv_id, invoices.created_at as date')
    .where('invoice_items.status = 1')
    .where(items: {merchant_id: merchant_id})
    .order('invoices.created_at')
  end
end