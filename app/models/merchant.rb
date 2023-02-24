class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  # def top_5_customers_by_transaction
  #   invoices.joins(:customer, :transactions).select("customers.*, count(transactions.id) as count").group("customers.id").where(transactions: {result: :success}).order("count desc, customers.last_name").limit(5)
  # end
end