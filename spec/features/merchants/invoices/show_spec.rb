require "rails_helper"


RSpec.describe 'Merchant Invoices Show Page' do

  before :each do 
    @merchant1 = Merchant.create!( name: "Dudes Habidashery")
    @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48) 
    @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
    @invoice1 = @customer1.invoices.create!( status: 1, created_at: 'Wednesday, February 22, 2023') 
    InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)

  end
  describe "As a merchant," do
    describe "When I visit my merchant's invoice show page(/merchant/merchant_id/invoices/invoice_id)" do
      it "Then I see the invoice id, status, and created_at date" do
        visit merchant_invoice_path(@merchant1.id, @invoice1.id)
        expect(page).to have_content(@invoice1.id)
        expect(page).to have_content(@invoice1.status)
        expect(page).to have_content(@invoice1.created_at.strftime("%A, %B %d, %Y"))
      end 
    end 
  end 
end 