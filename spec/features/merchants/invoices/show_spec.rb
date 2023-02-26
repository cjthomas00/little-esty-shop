require "rails_helper"


RSpec.describe 'Merchant Invoices Show Page' do

  before :each do 
    @merchant1 = Merchant.create!( name: "Dudes Habidashery")
    @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48) 
    @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
    @invoice1 = @customer1.invoices.create!( status: 1, created_at: 'Wednesday, February 22, 2023') 
    @invoice_item = InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
    @merchant2 = 
  end
  # User Story 15
  describe "As a merchant," do
    describe "When I visit my merchant's invoice show page(/merchant/merchant_id/invoices/invoice_id)" do
      it "Then I see the invoice id, status, and created_at date and I see the customer associated with the invoice" do
        visit merchant_invoice_path(@merchant1.id, @invoice1.id)
        expect(page).to have_content("Invoice ##{@invoice1.id}")
        expect(page).to have_content("Status: #{@invoice1.status}")
        expect(page).to have_content("Created on: #{@invoice1.created_at.strftime("%A, %B %d, %Y")}")
        expect(page).to have_content("Customer:")
        expect(page).to have_content("#{@customer1.first_name + " " + @customer1.last_name}")
      end
       # User Story 16
      describe "Then I see all of my items on the invoice including:" do
        it "The items name, quantity ordered, price sold for, and Invoice Item status" do
          visit merchant_invoice_path(@merchant1.id, @invoice1.id) 

          expect(page).to have_content("Items on this Invoice :")
          within "#item-" do 
            save_and_open_page
            expect(page).to have_content("#{@invoice1.items.first.name}")
            expect(page).to have_content("Units: #{@invoice_item.quantity}")
            expect(page).to have_content("Price: $48.00")
            expect(page).to have_content("Status: #{@invoice1.invoice_items.first.status}")
          end 
        end
      end
    end 
  end 
end 