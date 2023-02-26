require 'rails_helper'

RSpec.describe 'Merchant Invoice index' do 
  before :each do 
    @merchant1 = Merchant.create!( name: "Dudes Habidashery")
    @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48) 
    @item2 = @merchant1.items.create!(name: "Football", description: "Toy for kids", unit_price: 45) 
    @item3 = @merchant1.items.create!(name: "Lamp shade", description: "12 inch desk lamp", unit_price: 18) 
    @item4 = @merchant1.items.create!(name: "Wireless keyboard", description: "Wireless computer keyboard for mac", unit_price: 40) 
    @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
    @invoice1 = @customer1.invoices.create!( status: 1, created_at: 'Wednesday, February 22, 2023') 
    @invoice2 = @customer1.invoices.create!( status: 1, created_at: 'Thursday, February 23, 2023')
    @invoice3 = @customer1.invoices.create!( status: 1, created_at: 'Friday, February 24, 2023')
    @invoice4 = @customer1.invoices.create!( status: 1, created_at: 'Saturday, February 25, 2023')
    InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 12, unit_price: @item2.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice3.id, quantity: 11, unit_price: @item3.unit_price, status: 1)
    InvoiceItem.create!(item_id: @item4.id, invoice_id: @invoice4.id, quantity: 12, unit_price: @item4.unit_price, status: 1)
  end
  # User Story 14
  describe 'As a Merchant' do
    describe 'When I visit the Merchants invoice index (/merchants/merchant_id/invoices) ' do
      describe 'Then I see all of the invoices that include at least one of my merchants items' do
        it "And for each invoice I see its id and each id links to the merchant invoice show page" do
          visit merchant_invoices_path(@merchant1.id)
          expect(page).to have_link(@invoice1.id)
          expect(page).to have_link(@invoice2.id)
          expect(page).to have_link(@invoice3.id)
          expect(page).to have_link(@invoice4.id)  
          click_link "#{@invoice1.id}"
          expect(current_path).to eq(merchants_merchant_invoices_path(@merchant1, @invoice1.id))
        end
      end
    end
  end
end