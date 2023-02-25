require 'rails_helper'

describe 'admin index page' do
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
    @invoice12 = @customer1.invoices.create!( status: 2) 
    @invoice13 = @customer2.invoices.create!( status: 2) 
    @invoice14 = @customer3.invoices.create!( status: 2) 
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
    @transaction12 = @invoice12.transactions.create!( credit_card_number: 49722469057549123, credit_card_expiration_date: Date.new(2024, 1, 2), result: "success") 
    @transaction13 = @invoice13.transactions.create!( credit_card_number: 4972246905754234, credit_card_expiration_date: Date.new(2024, 2, 3), result: "success") 
    @transaction14 = @invoice14.transactions.create!( credit_card_number: 4972246905754456, credit_card_expiration_date: Date.new(2024, 3, 4), result: "success") 
    InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice3.id, quantity: 12, unit_price: @item1.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice5.id, quantity: 21, unit_price: @item2.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice7.id, quantity: 111, unit_price: @item3.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice9.id, quantity: 31, unit_price: @item4.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice11.id, quantity: 13, unit_price: @item1.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 1, unit_price: @item2.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice12.id, quantity: 1, unit_price: @item4.unit_price, status: 2)
    InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice13.id, quantity: 2, unit_price: @item1.unit_price, status: 2)
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice14.id, quantity: 3, unit_price: @item2.unit_price, status: 0)
  end

    describe 'user story 19' do
      it 'displays a header indicating that visitor is on the admin dashboard' do
        # visit admin_index_path 
        visit '/admin'

        expect(page).to have_content("Admin Dashboard")
      end
    end

    describe 'user story 20' do 
      it 'has links to the admin merchants index and the admin invoices index' do 
      
        visit admin_path 
        

        expect(page).to have_link("Admin Merchants")
        expect(page).to have_link("Admin Invoices")
      end
    end
  
    describe 'user story 21' do 
      it 'displays the top 5 customers with the largest number of successful transactions' do 
       
        visit admin_path 
     
        within "#top_five_customers-#{@customer1.id}" do
          expect(@customer1.first_name).to appear_before(@customer1.last_name)
        end
        within "#top_five_customers-#{@customer1.id}" do
          expect(page).to have_content("#{@customer1.first_name} #{@customer1.last_name} - #{@customer1.top_successful_transactions}")
        end

          expect(page).to have_content("Top 5 Customers")
          expect(page).to have_content("#{@customer2.first_name} #{@customer2.last_name} - #{@customer1.top_successful_transactions}")
          expect(page).to have_content("#{@customer3.first_name} #{@customer3.last_name} - #{@customer1.top_successful_transactions}")
          expect(page).to have_content("#{@customer5.first_name} #{@customer5.last_name} - #{@customer1.top_successful_transactions}")
          expect(page).to have_content("#{@customer6.first_name} #{@customer6.last_name} - #{@customer1.top_successful_transactions}")
      end
    end  

    describe 'user story 22' do 
      it 'displays a section for Incomplete Invoices' do 
  
        admin_path 
        
        expect(page).to have_content("Incomplete Invoices")
      end
     

    it 'shows a list of the ids of all invoices have items that have not yet been shipped' do
      
      visit admin_path 

      within('.incomplete_invoices') do
        expect(page).to have_content("Invoice ##{@invoice1.id}")
        expect(page).to have_content("Invoice ##{@invoice3.id}")
        expect(page).to have_content("Invoice ##{@invoice5.id}")
        expect(page).to have_content("Invoice ##{@invoice7.id}")
        expect(page).to have_content("Invoice ##{@invoice9.id}")
        expect(page).to have_content("Invoice ##{@invoice11.id}")
        expect(page).to have_content("Invoice ##{@invoice2.id}")
        expect(page).to_not have_content("Invoice ##{@invoice12.id}")
        expect(page).to_not have_content("Invoice ##{@invoice13.id}")
        expect(page).to_not have_content("Invoice ##{@invoice14.id}")
      end  
    end

      it 'shows each invoice id links to that invoices admin show page' do
        
        visit admin_path 

        within('.incomplete_invoices') do
          expect(page).to have_link("#{@invoice1.id}")
          expect(page).to have_link("#{@invoice3.id}")
          expect(page).to have_link("#{@invoice5.id}")
          expect(page).to have_link("#{@invoice7.id}")
          expect(page).to have_link("#{@invoice9.id}")
          expect(page).to have_link("#{@invoice11.id}")
          expect(page).to have_link("#{@invoice2.id}")
          expect(page).to_not have_link("#{@invoice12.id}")
          expect(page).to_not have_link("#{@invoice13.id}")
          expect(page).to_not have_link("#{@invoice14.id}")
        end  
      end

    describe 'user story 23' do 
      it 'displays a section for Incomplete Invoices' do 
  
        visit admin_path 
        
        expect(page).to have_content("Incomplete Invoices")
        expect(@invoice7.created_at.strftime("%A, %B %d, %Y")).to appear_before(@invoice1.created_at.strftime("%A, %B %d, %Y"))
      end

      it 'shows beside each invoice id is the date that the invoice was created' do
      
        visit admin_path 

        within('.incomplete_invoices') do
          expect(page).to have_content("Invoice ##{@invoice1.id}")
          expect(page).to have_content("Invoice ##{@invoice3.id}")
          expect(page).to have_content("Invoice ##{@invoice5.id}")
          expect(page).to have_content("Invoice ##{@invoice7.id}")
          expect(page).to have_content("Invoice ##{@invoice9.id}")
          expect(page).to have_content("Invoice ##{@invoice11.id}")
          expect(page).to have_content("Invoice ##{@invoice2.id}")
          expect(page).to_not have_content("Invoice ##{@invoice12.id}")
          expect(page).to_not have_content("Invoice ##{@invoice13.id}")
          expect(page).to_not have_content("Invoice ##{@invoice14.id}")
        end  
      end

    
      it 'shows the list is ordered from oldest to newest' do  
        visit admin_path 

        within('.incomplete_invoices') do
          expect(page).to have_link("#{@invoice1.id}")
          expect(page).to have_link("#{@invoice3.id}")
          expect(page).to have_link("#{@invoice5.id}")
          expect(page).to have_link("#{@invoice7.id}")
          expect(page).to have_link("#{@invoice9.id}")
          expect(page).to have_link("#{@invoice11.id}")
          expect(page).to have_link("#{@invoice2.id}")
          expect(page).to_not have_link("#{@invoice12.id}")
          expect(page).to_not have_link("#{@invoice13.id}")
          expect(page).to_not have_link("#{@invoice14.id}")
        end  
      end
  end
end
