require 'rails_helper'

describe 'admin invoice show page' do
  before :each do 
    @invoice = FactoryBot.create_list(:invoice, 3)
    # @item = FactoryBot.create_list(:item, 5)
    # @invoice_item = FactoryBot.create_list(:invoice_item, 3, invoice: @invoice[1], item: @item[1])
   
    @merchant = FactoryBot.create(:merchant)
    @customer = FactoryBot.create(:customer)
    @invoice1 = @customer.invoices.create!( status: 1) 
    @item_1 = @merchant.items.create!(name: "water bottle", description: "24oz metal container for water", unit_price: 8) 
    @item_2 = @merchant.items.create!(name: "lamp", description: "12 inch desk lamp", unit_price: 16)
    @invoice_item_1 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item_1.unit_price, status: 1)
    @invoice_item_2 = InvoiceItem.create!(item_id: @item_2.id, invoice_id: @invoice1.id, quantity: 12, unit_price: @item_2.unit_price, status: 1)
  end

  describe 'user story 32' do
    it 'displays the invoice information including the id, status, date, first and last name' do
      # visit admin_invoices_path(@invoice[1].id)
      visit "/admin/invoices/#{@invoice[1].id}"
  
      within(".invoices_info") do
  
        expect(page).to have_content(@invoice[1].id)
        expect(page).to have_content(@invoice[1].status.capitalize)
        expect(page).to have_content(@invoice[1].date)
        expect(page).to have_content(@invoice[1].customer_name)
      end  
    end
  end

  describe 'user story 33' do
    it 'displays the invoice information including the id, status, date, first and last name' do
      # visit admin_invoices_path(@invoice[1].id)
      visit "/admin/invoices/#{@invoice[1].id}"
  
      within(".invoices_info") do
  
        expect(page).to have_content(@invoice[1].id)
        expect(page).to have_content(@invoice[1].status.capitalize)
        expect(page).to have_content(@invoice[1].date)
        expect(page).to have_content(@invoice[1].customer_name)
      end  
    end
  end

  describe 'user story 34' do
    it 'displays all of the items on the invoice including the name, quantity, price, and status' do
      # visit admin_invoices_path(@invoice[1].id)
      visit "/admin/invoices/#{@invoice1.id}"
      
      within(".invoices_item_info") do
      # save_and_open_page
        expect(page).to have_content("Item Name: #{@invoice_item_1.item.name}")
        expect(page).to have_content("Quantity: #{@invoice_item_1.quantity}")
        expect(page).to have_content("Price: $#{@invoice_item_1.unit_price.to_f}")
        expect(page).to have_content("Status: #{@invoice_item_1.status.capitalize}")
      end  
    end
  end

  describe 'user story 35' do 
    it ' displays the total revenue that will be generated from the invoice' do 
      visit "/admin/invoices/#{@invoice1.id}" 

      within(".invoices_info") do 
        expect(page).to have_content("Total Revenue: $280.00")
      end
    end
  end

  describe 'user story 36 - Update Invoice Status' do 
    it 'has the invoice status as a select field, with current status selected' do 
      visit "/admin/invoices/#{@invoice1.id}" 

      within(".select_status") do 
        expect(page).to have_content("completed")
        expect(page).to have_content("in progress")
        expect(page).to have_content("cancelled")
      end
    end

    it 'can select a new status for the Invoice, and has a button to update invoice status' do 
      visit "/admin/invoices/#{@invoice1.id}" 
   
        within(".select_status") do 
          choose('invoice_status_completed')
          click_button("Update Invoice Status") 
        end
        
      expect(current_path).to eq("/admin/invoices/#{@invoice1.id}")
    end

    it 'after clicking button, it redirects to invoice show page, and shows the new status' do 
      visit "/admin/invoices/#{@invoice1.id}" 

      within(".select_status") do 
          choose('invoice_status_completed')
          click_button("Update Invoice Status") 
        end
        
      expect(current_path).to eq("/admin/invoices/#{@invoice1.id}")
    
      within(".invoices_info") do 
        expect(page).to have_content('Status: Completed')
      end
    end
  end
end    


