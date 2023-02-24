class Customer < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  def self.top_5_customers_with_success  #==> returns customer first and last names. Need to get transactions in here.
    select('customers.first_name, customers.last_name, count(transactions.id) as transaction_count')
    .joins(:transactions)
    .where(transactions: {result: 0})
    .group(:id)
    .order('transaction_count desc')
    .limit(5)
  end
end