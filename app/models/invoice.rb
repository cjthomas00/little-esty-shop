class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  enum status: ["completed", "in progress", "cancelled"]

  def self.incomplete_invoices
    joins(:invoice_items).order(created_at: :asc).where.not(status: 2).distinct
  end

  def date
    created_at.strftime("%A, %B %d, %Y")
  end

  def customer_name
    customer.name
  end

  # def status
  #   invoice.status.capitalize
  # end
end 