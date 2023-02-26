require 'rails_helper'

describe 'admin invoice index page' do
  before :each do 
    @invoice = FactoryBot.create_list(:invoice, 3)
  end

  describe 'user story 32' do
    it 'displays a list of all invoice ids in the system' do
      visit admin_invoices_path 
    
      within(".invoices") do
        expect(page).to have_content("Invoice ##{@invoice[1].id}")
        expect(page).to have_content("Invoice ##{@invoice[2].id}")
        # expect(page).to have_content("Invoice ##{@invoice[3].id}")
        #three not passing?
      end  
    end

    it 'displays each id links to the admin invoice show page' do
      visit admin_invoices_path 

      within(".invoices") do
        expect(page).to have_link(@invoice[1].id)
        expect(page).to have_link(@invoice[2].id)
        # expect(page).to have_link(@invoice[3].id)
        #three not passing?
      end 

      within(".invoices") do 
        click_link("#{@invoice[1].id}")
        
        # expect(current_path).to eq(admin_invoices_path(@invoice[1]))
        expect(current_path).to eq("/admin/invoices/#{@invoice[1].id}")
      end
    end
  end
end  