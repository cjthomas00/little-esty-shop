require 'rails_helper'

describe 'admin invoice show page' do
  before :each do 
    @invoice = FactoryBot.create_list(:invoice, 3)
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
#   34. Admin Invoice Show Page: Invoice Item Information

# As an admin
# When I visit an admin invoice show page
# Then I see all of the items on the invoice including:
# - Item name
# - The quantity of the item ordered
# - The price the Item sold for
# - The Invoice Item status

describe 'user story 34' do
  it 'displays all of the items on the invoice including the name, quantity, price, and status' do
    # visit admin_invoices_path(@invoice[1].id)
    visit "/admin/invoices/#{@item[1].id}"

    within(".invoices_item_info") do

      expect(page).to have_content(@item[1].name)
      expect(page).to have_content(@item[1].quantity)
      expect(page).to have_content(@item[1].price)
      expect(page).to have_content(@item[1].status)
    end  
  end
end
end    