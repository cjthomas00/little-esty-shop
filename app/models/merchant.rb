class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  
  enum status: ["Disabled", "Enabled"]

  def top_5_customers_by_transaction
    customers.joins(:transactions).where(transactions: {result: 'success'}).select("customers.*, count(DISTINCT transactions.id) as transactions_count").group("customers.id").order("transactions_count desc").limit(5)
  end 

  def successful_customer_transactions(customer_id)
    Transaction.joins(invoice: [:items, :customer]).where(result: 'success').where(items: { merchant_id: self.id }).where(customers: {id: customer_id }).distinct.count
  end
  
  def self.enabled_merchants 
    where(status: 1)
  end

  def self.disabled_merchants 
    where(status: 0)
  end

  def self.top_5_merchants_by_revenue 
    joins(:transactions)
      .where('transactions.result': 0)
      .select('merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) as total_rev')
      .group(:id)
      .order('total_rev desc')
      .limit(5)
  end
end