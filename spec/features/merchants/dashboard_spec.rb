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
    @invoice1 = @customer1.invoices.create!( status: 1, created_at: 'Wednesday, February 22, 2023') 
    @invoice2 = @customer1.invoices.create!( status: 1, created_at: 'Thursday, February 23, 2023')
    @invoice3 = @customer2.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice4 = @customer2.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice5 = @customer3.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice6 = @customer3.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice7 = @customer4.invoices.create!( status: 1, created_at: 'Friday, February 17, 2023')
    @invoice8 = @customer5.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice9 = @customer5.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice10 = @customer6.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice11 = @customer6.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48) 
    @item2 = @merchant1.items.create!(name: "Football", description: "Toy for kids", unit_price: 45) 
    @item3 = @merchant1.items.create!(name: "Lamp shade", description: "12 inch desk lamp", unit_price: 18) 
    @item4 = @merchant1.items.create!(name: "Wireless keyboard", description: "Wireless computer keyboard for mac", unit_price: 40) 
    @item5 = @merchant1.items.create!(name: "Chapstick", description: "original flavor chapstick", unit_price: 2) 
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
    visit merchant_dashboard_index_path(@merchant1.id)
  end

  describe ' As a Merchant ' do 
    describe 'When I visit my merchant dashboard (/merchants/merchant_id/dashboard)' do
      # User story 1
      it "Then I see the name of my merchant " do
      
        expect(current_path).to eq("/merchants/#{@merchant1.id}/dashboard")
        expect(page).to have_content(@merchant1.name)
      end 
      # user story 2
      it "Then I see link to my merchant items index (/merchants/merchant_id/items)" do 
       
        expect(page).to have_button("My Items")
        click_button "My Items"
        expect(current_path).to eq("/merchants/#{@merchant1.id}/items")
      end
      it "And I see a link to my merchant invoices index (/merchants/merchant_id/invoices)" do

        expect(page).to have_button("My Invoices")
        click_button "My Invoices"
        expect(current_path).to eq("/merchants/#{@merchant1.id}/invoices")
      end
      #user story 3
      it 'Then I see the names of the top 5 customers who have conducted the largest number of successful transactions with my merchant' do
  
        expect(page).to have_content("My Favorite Customers")

        within "#top_5_customers-#{@customer1.id}" do
          expect(@customer1.first_name).to appear_before(@customer1.last_name)
          expect(@customer1.last_name).to appear_before(": 2")
        end
        within "#top_5_customers-#{@customer2.id}" do
          expect(@customer2.first_name).to appear_before(@customer2.last_name)
          expect(@customer2.last_name).to appear_before(": 1")
        end

        within "#top_5_customers-#{@customer3.id}" do
          expect(@customer3.first_name).to appear_before(@customer3.last_name)
          expect(@customer3.last_name).to appear_before(": 1")
        end
        within "#top_5_customers-#{@customer5.id}" do
          expect(@customer5.first_name).to appear_before(@customer5.last_name)
          expect(@customer5.last_name).to appear_before(": 1")
        end
        within "#top_5_customers-#{@customer6.id}" do
          expect(@customer6.first_name).to appear_before(@customer6.last_name)
          expect(@customer6.last_name).to appear_before(": 1")
        end
      end
      #user story 4
      describe "Then I see a section for 'Items Ready to Ship'" do 
        it ' In that section I see a list of the names of all of my items that have been ordered and have not yet been shipped ' do
                   
          expect(page).to have_content("Items Ready to Ship")  
          expect(page).to have_content("#{@item1.name}")
          expect(page).to have_content("#{@item3.name}")
          expect(page).to have_no_content("#{@item2.name}")
          expect(page).to have_no_content("#{@item4.name}")
          expect(page).to have_no_content("#{@item5.name}")
        end
        
        it "and next to each Item I see the id of the invoice that ordered my item and each invoice id is a link to my merchants invoice show page'" do
          
          expect(page).to have_link("#{@invoice1.id}")
          expect(page).to have_link("#{@invoice3.id}")
          expect(page).to have_link("#{@invoice7.id}")
          expect(page).to have_no_link("#{@invoice2.id}")
          expect(page).to have_no_link("#{@invoice4.id}")
          expect(page).to have_no_link("#{@invoice6.id}")
          expect(page).to have_no_link("#{@invoice5.id}")
        end
        #User Story 5
        it "Next to each Item name I see the date that the invoice was created And I see the date formatted like 'Monday, July 18, 2019' And I see that the list is ordered from oldest to newest" do
         
          expect(page).to have_content("Lamp shade: Invoice # #{@invoice7.id} Created At: Friday, February 17, 2023")
          expect(page).to have_content("Yeti bottle: Invoice # #{@invoice1.id} Created At: Wednesday, February 22, 2023")
          expect(page).to have_content("Yeti bottle: Invoice # #{@invoice3.id} Created At: Friday, February 24, 2023")
          within "#items_ready_to_ship-#{@item3.id}" do
            expect(@item3.name).to appear_before(@item1.name)
            expect(@invoice7.created_at.strftime("%A, %B %d, %Y")).to appear_before(@invoice1.created_at.strftime("%A, %B %d, %Y"))
          end
        end
      end
    end 
  end
end