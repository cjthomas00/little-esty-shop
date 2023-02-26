require 'rails_helper'

describe 'admin invoice show page' do
  before :each do 
    @invoice = FactoryBot.create_list(:invoice, 3)
    @item = FactoryBot.create_list(:item, 5)
    @invoice_item = FactoryBot.create_list(:invoice_item, 3, invoice: @invoice[1], item: @item[1])
    # require 'pry'; binding.pry
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
      visit "/admin/invoices/#{@invoice[1].id}"
      # save_and_open_page
      within(".invoices_item_info") do

        expect(page).to have_content(@invoice[1].invoice_items[1].item.name)
        expect(page).to have_content(@invoice[1].invoice_items[1].item.quantity)
        expect(page).to have_content(@invoice[1].invoice_items[1].item.unit_price)
        expect(page).to have_content(@invoice[1].invoice_items[1].item.status.capitalize)
      end  
    end
  end
end    