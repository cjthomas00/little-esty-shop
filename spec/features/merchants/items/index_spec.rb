require 'rails_helper'

RSpec.describe 'Merchant items index', type: :feature do
  describe 'As a merchant' do
    before :each do
      @merchant1 = Merchant.create!( name: "Dudes Habidashery")
      @merchant2 = Merchant.create!( name: "Genreal Store")
      @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
      @customer2 = Customer.create!( first_name: "Mike", last_name: "Smith")
      @customer3 = Customer.create!( first_name: "Brian", last_name: "Johnson")
      @customer4 = Customer.create!( first_name: "Clark", last_name: "Griswold")
      @customer5 = Customer.create!( first_name: "Nick", last_name: "Green")
      @customer6 = Customer.create!( first_name: "Lyla", last_name: "Thomas")
      @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48, status: 1) 
      @item2 = @merchant1.items.create!(name: "Football", description: "toy for kids", unit_price: 45, status: 1) 
      @item3 = @merchant1.items.create!(name: "Lamp shade", description: "12 inch desk lamp shade", unit_price: 18, status: 1) 
      @item4 = @merchant1.items.create!(name: "Wireless keyboard", description: "wireless computer keyboard for mac", unit_price: 40, status: 0) 
      @item5 = @merchant1.items.create!(name: "Chapstick", description: "original flavor chapstick", unit_price: 2, status: 0)
      @item6 = @merchant2.items.create!(name: "Arctic bottle", description: "24oz metal container for water", unit_price: 48, status: 1) 
      @item7 = @merchant2.items.create!(name: "Basketball", description: "toy for kids", unit_price: 45, status: 0) 
      @item8 = @merchant2.items.create!(name: "Window Covering", description: "Window blinds", unit_price: 18, status: 1) 
      @item9 = @merchant2.items.create!(name: "Wired Mouse", description: "A mouse for a PC", unit_price: 20, status: 0) 
      @item10 = @merchant2.items.create!(name: "Bubble Gum", description: "original flavor bubble gum", unit_price: 2, status: 1)
      @invoice1 = @customer1.invoices.create!( status: 1, created_at: 'Wednesday, February 22, 2023') 
      @invoice2 = @customer1.invoices.create!( status: 1, created_at: 'Thursday, February 23, 2023')
      @invoice3 = @customer2.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
      @invoice5 = @customer3.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
      @invoice7 = @customer1.invoices.create!( status: 1, created_at: 'Wednesday, February 22, 2023') 
      @invoice9 = @customer1.invoices.create!( status: 1, created_at: 'Thursday, February 23, 2023')
      @invoice11 = @customer2.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
      InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice3.id, quantity: 12, unit_price: @item1.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice5.id, quantity: 21, unit_price: @item2.unit_price, status: 2)
      InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice7.id, quantity: 111, unit_price: @item3.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice9.id, quantity: 31, unit_price: @item4.unit_price, status: 0)
      InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice11.id, quantity: 13, unit_price: @item1.unit_price, status: 0)
      InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 1, unit_price: @item2.unit_price, status: 2)
      @transaction1 = @invoice1.transactions.create!(  credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction2 = @invoice2.transactions.create!(  credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction3 = @invoice3.transactions.create!(  credit_card_number: 4140149827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction5 = @invoice5.transactions.create!(  credit_card_number: 4763141973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction14 = @invoice7.transactions.create!( credit_card_number: 4504301557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") 
      @transaction15 = @invoice7.transactions.create!( credit_card_number: 4504301557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction8 = @invoice9.transactions.create!( credit_card_number: 4173081602435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success")       
      @transaction11 = @invoice11.transactions.create!( credit_card_number: 4972246905754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      visit merchant_items_path(@merchant1)
    end
    describe "When I visit my merchant items index page (merchants/merchant_id/items)" do
      #user story 6
      it 'I see a list of the names of all of my items and I do not see items for any other merchant' do
        
        expect(page).to have_content("#{@merchant1.name}'s Items")
        expect(page).to have_content(@item1.name)
        expect(page).to have_content(@item2.name)
        expect(page).to have_content(@item3.name)
        expect(page).to have_content(@item4.name)
        expect(page).to have_content(@item5.name)
        expect(page).to have_no_content(@item6.name)
        expect(page).to have_no_content(@item7.name)
        expect(page).to have_no_content(@item8.name)
        expect(page).to have_no_content(@item9.name)
        expect(page).to have_no_content(@item10.name)
      end

      #user story 7
      it "When I click on the name of an item from the merchant items index page,
      Then I am taken to that merchant's item's show page (/merchants/merchant_id/items/item_id)" do
        expect(page).to have_link("#{@item1.name}")
        expect(page).to have_link("#{@item2.name}")
        expect(page).to have_link("#{@item3.name}")
        expect(page).to have_link("#{@item4.name}")
        expect(page).to have_link("#{@item5.name}")
        expect(page).to have_no_link("#{@item6.name}")
        expect(page).to have_no_link("#{@item7.name}")
        expect(page).to have_no_link("#{@item8.name}")
        expect(page).to have_no_link("#{@item9.name}")
        expect(page).to have_no_link("#{@item10.name}")
        within ".enabled_items" do 
        click_link("#{@item1.name}") 
        expect(current_path).to eq(merchant_item_path(@merchant1, @item1))
        end
      end
    end

    #user story 9
    describe "When I visit my items index page next to each item name I see a button to disable or enable that item" do
      it "When I click this button then I am redirected back to the items index and I see that the items status has changed" do
        within "#disabled_item_id-#{@item4.id}" do
        expect(page).to have_content("Item Status: Disabled")
        expect(page).to have_button("Enable #{@item4.name}")
        click_button("Enable #{@item4.name}")
      end
        within "#enabled_item_id-#{@item4.id}" do 
        expect(page).to have_content("Item Status: Enabled")
        expect(page).to have_button("Disable #{@item4.name}")
        expect(current_path).to eq(merchant_items_path(@merchant1))
        end
      end
    end

    #user story 10
    describe "When I visit my merchant items index page" do
      it "Then I see two sections, one for Enabled Items and one for Disabled Items, and I see that each Item is listed in the appropriate section" do
        expect(page).to have_content("Enabled Items") 
        expect(page).to have_content("Disabled Items")

        within(".enabled_items")  do 
          expect(page).to have_content(@item1.name)
          expect(page).to have_content(@item2.name)
          expect(page).to have_content(@item3.name)
          expect(page).to have_no_content(@item4.name)
          expect(page).to have_no_content(@item5.name)
        end
        within(".disabled_items")  do 
          expect(page).to have_content(@item4.name)
          expect(page).to have_content(@item5.name)
          expect(page).to have_no_content(@item1.name)
          expect(page).to have_no_content(@item2.name)
          expect(page).to have_no_content(@item3.name)
        end
      end
    end

     #user story 11
     describe "When I visit my items index page" do
      it "I see a link to create a new item." do
        expect(page).to have_link("New Item")
      end
    end

    #user story 12
    describe "When I visit my items index page" do
      it "Then I see the names of the top 5 most popular items ranked by total revenue generated And I see that each item name links to my merchant item show page for that item And I see the total revenue generated next to each item name " do
        expect(page).to have_content("Top 5 Most Popular Items")
        
        within(".top_5_items")  do 
          expect(page).to have_link("#{@item1.name}")
          expect(page).to have_link("#{@item2.name}")
          expect(page).to have_link("#{@item3.name}")
          expect(page).to have_link("#{@item4.name}")
          expect(page).to have_link("#{@item5.name}")
          expect(@item3.name).to appear_before(@item4.name)
          expect(@item4.name).to appear_before(@item1.name)
          expect(@item1.name).to appear_before(@item2.name)
          expect(@item2.name).to appear_before(@item5.name)
          expect(page).to have_content("#{@item3.name} Total Revenue Generated: $1,998.00")
          expect(page).to have_content("#{@item4.name} Total Revenue Generated: $1,240.00")
          expect(page).to have_content("#{@item1.name} Total Revenue Generated: $1,104.00")
          expect(page).to have_content("#{@item2.name} Total Revenue Generated: $990.00")
          expect(page).to have_content("#{@item5.name} Total Revenue Generated: $624.00")
        end
      end
    end

    #user story 13
    describe "When I visit my items index page" do
      it "Then next to each of the 5 most popular items I see the date with the most sales for each item. And I see a label 'Top selling date for <item name> was <date with most sales>'" do
        within(".top_5_items")  do 
          expect(page).to have_content("Top selling date for #{@item3.name} was #{@item3.invoice_items.top_sales_date.strftime("%A, %B %d, %Y")}")
        end
      end
    end
  end
end