require 'rails_helper'

RSpec.describe InvoiceItem do 
  describe 'relationships' do 
    it {should belong_to :item}
    it {should belong_to :invoice}
    it {should have_many(:transactions).through(:invoice)}
    it {should have_one(:merchant).through(:item)}
    it {should have_one(:customer).through(:invoice)}
  end

  describe 'validations' do 
    it {should validate_numericality_of :quantity}
    it {should validate_numericality_of :unit_price}
    it {should validate_numericality_of(:unit_price).is_greater_than_or_equal_to(0)}
    it {should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0)}
  end

  before :each do 
    @merchant1 = Merchant.create!( name: "Dudes Habidashery")
    @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
    @invoice1 = @customer1.invoices.create!( status: 1) 
    @invoice2 = @customer1.invoices.create!( status: 0) 
    @item1 = @merchant1.items.create!(name: "water bottle", description: "24oz metal container for water", unit_price: 8) 
    @item2 = @merchant1.items.create!(name: "rubber duck", description: "toy for bath", unit_price: 1) 
    @transaction1 = @invoice1.transactions.create!(  credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success")
    @transaction2 = @invoice1.transactions.create!(  credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed")
    @invoice_item_1 = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 0)
    @invoice_item_2 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 12, unit_price: @item2.unit_price, status: 1)
    @invoice_item_3 = InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 12, unit_price: @item2.unit_price, status: 2)
  end
  
  it 'status can be pending' do
    expect(@invoice_item_1.status).to eq("pending")
    expect(@invoice_item_1.pending?).to eq(true)
    expect(@invoice_item_1.packaged?).to eq(false)
    expect(@invoice_item_1.shipped?).to eq(false)
  end
  
  it 'status can be packaged' do    
    expect(@invoice_item_2.status).to eq("packaged")
    expect(@invoice_item_2.pending?).to eq(false)
    expect(@invoice_item_2.packaged?).to eq(true)
    expect(@invoice_item_2.shipped?).to eq(false)
  end
  
  it 'status can be shipped' do
    expect(@invoice_item_3.status).to eq("shipped")
    expect(@invoice_item_3.pending?).to eq(false)
    expect(@invoice_item_3.packaged?).to eq(false)
    expect(@invoice_item_3.shipped?).to eq(true)
  end

  describe 'class methods' do
    describe '::top_sales_date' do
      it "returns the date with most sales based on total_revenue" do
        expect(InvoiceItem.top_sales_date).to eq(@invoice1.created_at)
      end
    end
  end
end