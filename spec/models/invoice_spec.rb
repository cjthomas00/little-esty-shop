require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should have_many(:transactions)}
    it { should have_many(:items).through(:invoice_items)}
  end

  before :each do 
    @merchant1 = Merchant.create!( name: "Dudes Habidashery")
    @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
    @invoice1 = @customer1.invoices.create!( status: 1) 
    @invoice2 = @customer1.invoices.create!( status: 2)
    @invoice3 = @customer1.invoices.create!( status: 0)
    @item1 = @merchant1.items.create!(name: "water bottle", description: "24oz metal container for water", unit_price: 8) 
    @item2 = @merchant1.items.create!(name: "rubber duck", description: "toy for bath", unit_price: 1) 
    @invoice_item_1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
    @invoice_item_2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 12, unit_price: @item2.unit_price, status: 1)
  end

  it 'status can be in progress' do
    expect(@invoice1.status).to eq("in_progress")
    expect(@invoice1.completed?).to eq(false)
    expect(@invoice1.in_progress?).to eq(true)
    expect(@invoice1.cancelled?).to eq(false)
  end
  
  it 'status can be cancelled' do    
    expect(@invoice2.status).to eq("cancelled")
    expect(@invoice2.completed?).to eq(false)
    expect(@invoice2.in_progress?).to eq(false)
    expect(@invoice2.cancelled?).to eq(true)
  end
  
  it 'status can be completed' do
    expect(@invoice3.status).to eq("completed")
    expect(@invoice3.completed?).to eq(true)
    expect(@invoice3.in_progress?).to eq(false)
    expect(@invoice3.cancelled?).to eq(false)
  end

  describe '#total_revenue' do 
    it 'is the total revenue generated' do 
      expect(@invoice1.total_revenue).to eq(100)
    end
  end

  describe '#date' do
    it 'formats date' do
      expect(@invoice1.date).to eq(@invoice1.created_at.strftime("%A, %B %d, %Y"))
    end
  end

  describe '#customer_name' do
    it 'returns a customers name' do
      expect(@invoice1.customer_name).to eq("Britney Johnson")
      expect(@invoice1.customer_name).to_not eq("By John")
    end
  end

  describe '::incomplete_invoices' do
    it 'returns incomplete invoices' do
      expect(Invoice.incomplete_invoices).to eq([@invoice1])
      expect(Invoice.incomplete_invoices).to_not eq([@invoice2, @invoice3])
    end
  end
end


