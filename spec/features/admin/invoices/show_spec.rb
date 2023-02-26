require 'rails_helper'

describe 'admin invoice show page' do
  before :each do 
    @invoice = FactoryBot.create_list(:invoice, 3)
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
end    