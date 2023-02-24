require 'rails_helper'

RSpec.describe 'Merchant Dashboard', type: :feature  do

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
    @item1 = @merchant1.items.create!(name: "water bottle", description: "24oz metal container for water", unit_price: 8) 
    @item2 = @merchant1.items.create!(name: "rubber duck", description: "toy for bath", unit_price: 1) 
    @item3 = @merchant1.items.create!(name: "lamp", description: "12 inch desk lamp", unit_price: 16) 
    @item4 = @merchant1.items.create!(name: "wireless mouse", description: "wireless computer mouse for mac", unit_price: 40) 
    @item5 = @merchant1.items.create!(name: "chapstick", description: "coconut flavor chapstick", unit_price: 2) 
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
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice5.id, quantity: 21, unit_price: @item2.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice7.id, quantity: 111, unit_price: @item3.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice9.id, quantity: 31, unit_price: @item4.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice11.id, quantity: 13, unit_price: @item1.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 1, unit_price: @item2.unit_price, status: 1)
    @merchant = Merchant.create!(name: "dude")
  end

  describe ' As a Merchant ' do 
    describe 'When I visit my merchant dashboard (/merchants/merchant_id/dashboard)' do
      # User story 1
      it "Then I see the name of my merchant " do
        visit merchant_dashboard_index_path(@merchant.id)

        expect(current_path).to eq("/merchant/#{@merchant.id}/dashboard")
        expect(page).to have_content(@merchant.name)
      end 
      # user story 2
      it "Then I see link to my merchant items index (/merchants/merchant_id/items)" do 
        visit merchant_dashboard_index_path(@merchant.id)

        expect(page).to have_button("My Items")
        click_button "My Items"
        expect(current_path).to eq("/merchant/#{@merchant.id}/items")
      end
      it "And I see a link to my merchant invoices index (/merchants/merchant_id/invoices)" do
        visit merchant_dashboard_index_path(@merchant.id)

        expect(page).to have_button("My Invoices")
        click_button "My Invoices"
        expect(current_path).to eq("/merchant/#{@merchant.id}/invoices")
      end
      #user story 3
      it 'Then I see the names of the top 5 customers who have conducted the largest number of successful transactions with my merchant' do
        visit merchant_dashboard_index_path(@merchant1.id)
  
        expect(page).to have_content("My Favorite Customers")
        expect(page).to have_content("#{@customer1.first_name} #{@customer1.last_name} 2")
        expect(page).to have_content("#{@customer2.first_name} #{@customer2.last_name} 1")
        expect(page).to have_content("#{@customer3.first_name} #{@customer3.last_name} 1")
        expect(page).to have_content("#{@customer5.first_name} #{@customer5.last_name} 1")
        expect(page).to have_content("#{@customer6.first_name} #{@customer6.last_name} 1")
      end
    end 
  end
end