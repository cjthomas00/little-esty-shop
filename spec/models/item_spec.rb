require 'rails_helper' 

RSpec.describe Item do 
  describe 'relationships' do 
    it {should have_many :invoice_items}
    it {should have_many :invoices}
    it {should belong_to :merchant}
  end

  describe 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_numericality_of :unit_price}
  end

  describe '::methods' do
    before :each do
    @merchant1 = Merchant.create!( name: "Dudes Habidashery")
    @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
    @customer2 = Customer.create!( first_name: "Mike", last_name: "Smith")
    @customer3 = Customer.create!( first_name: "Brian", last_name: "Johnson")
    @customer4 = Customer.create!( first_name: "Clark", last_name: "Griswold")
    @customer5 = Customer.create!( first_name: "Nick", last_name: "Green")
    @customer6 = Customer.create!( first_name: "Lyla", last_name: "Thomas")
    @invoice1 = @customer1.invoices.create!( status: 1) 
    @invoice2 = @customer1.invoices.create!( status: 1) 
    @invoice3 = @customer2.invoices.create!( status: 1) 
    @invoice4 = @customer2.invoices.create!( status: 1) 
    @invoice5 = @customer3.invoices.create!( status: 1) 
    @invoice6 = @customer3.invoices.create!( status: 1) 
    @invoice7 = @customer4.invoices.create!( status: 1) 
    @invoice8 = @customer5.invoices.create!( status: 1) 
    @invoice9 = @customer5.invoices.create!( status: 1) 
    @invoice10 = @customer6.invoices.create!( status: 1) 
    @invoice11 = @customer6.invoices.create!( status: 1) 
    @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48) 
    @item2 = @merchant1.items.create!(name: "football", description: "toy for kids", unit_price: 45) 
    @item3 = @merchant1.items.create!(name: "lamp shade", description: "12 inch desk lamp", unit_price: 18) 
    @item4 = @merchant1.items.create!(name: "wireless keyboard", description: "wireless computer keyboard for mac", unit_price: 40) 
    @item5 = @merchant1.items.create!(name: "chapstick", description: "original flavor chapstick", unit_price: 2) 
    @transaction1 = @invoice1.transactions.create!(  credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction2 = @invoice2.transactions.create!(  credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction3 = @invoice3.transactions.create!(  credit_card_number: 4140149827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction4 = @invoice4.transactions.create!(  credit_card_number: 4140149827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction5 = @invoice5.transactions.create!(  credit_card_number: 4763141973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction6 = @invoice6.transactions.create!(  credit_card_number: 4763141973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction14 = @invoice7.transactions.create!( credit_card_number: 4504301557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") 
    @transaction15 = @invoice7.transactions.create!( credit_card_number: 4504301557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction7 = @invoice8.transactions.create!(  credit_card_number: 4173081602435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction8 = @invoice9.transactions.create!( credit_card_number: 4173081602435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction9 = @invoice10.transactions.create!( credit_card_number: 4972246905754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") 
    @transaction10 = @invoice10.transactions.create!( credit_card_number: 4972246905754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    @transaction11 = @invoice11.transactions.create!( credit_card_number: 4972246905754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
    InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice3.id, quantity: 12, unit_price: @item1.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice5.id, quantity: 21, unit_price: @item2.unit_price, status: 2)
    InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice7.id, quantity: 111, unit_price: @item3.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice9.id, quantity: 31, unit_price: @item4.unit_price, status: 0)
    InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice11.id, quantity: 13, unit_price: @item1.unit_price, status: 0)
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 1, unit_price: @item2.unit_price, status: 2)
    end

    it '::ready_to_ship(merchant_id)' do
      expect(Item.ready_to_ship(@merchant1.id)).to eq([@item1, @item1, @item3])
    end
  end
end