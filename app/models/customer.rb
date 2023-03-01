class Customer < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  validates_presence_of :first_name, :last_name

  def self.top_five_customer
    Customer.joins(:transactions).where(transactions: {result: 'success'}).select("customers.*, count(DISTINCT transactions.id) as transactions_count").group("customers.id").order("transactions_count desc").limit(5)
  end  

  def top_successful_transactions
    Transaction.where(result: 'success').count
  end  

  def name
    first_name + " " + last_name
  end
end  