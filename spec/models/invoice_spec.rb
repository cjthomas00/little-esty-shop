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
    @item1 = @merchant1.items.create!(name: "water bottle", description: "24oz metal container for water", unit_price: 8) 
    @item2 = @merchant1.items.create!(name: "rubber duck", description: "toy for bath", unit_price: 1) 
    @invoice_item_1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
    @invoice_item_2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 12, unit_price: @item2.unit_price, status: 1)
  end

  describe '#total_revenue' do 
    it 'is the total revenue generated' do 
      expect(@invoice1.total_revenue).to eq(100)
    end
  end
end