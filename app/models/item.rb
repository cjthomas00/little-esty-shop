class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  validates_presence_of :name, :description
  validates :unit_price, numericality: { greater_than_or_equal_to: 0}

  enum status: [:disabled, :enabled]

  def self.ready_to_ship(merchant_id)
    joins(invoice_items: :invoice)
    .select('items.*,invoice_items.id as inv_item_id, invoices.id as inv_id, invoices.created_at as date')
    .where('invoice_items.status = 1')
    .where(items: {merchant_id: merchant_id})
    .order('invoices.created_at')
  end

  def self.enabled_items
   where(status: 1)
  end

  def self.disabled_items
    where(status: 0)
  end

  def self.top_5_items
    select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue')
    .joins(:transactions)
    .where(transactions: {result: :success})
    .group('items.id')
    .order(total_revenue: :desc)
    .limit(5)
  end
end