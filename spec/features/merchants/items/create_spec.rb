require 'rails_helper' 

RSpec.describe 'Merchant Items new' do
  describe "As a merchant" do
    before :each do
      @merchant1 = Merchant.create!( name: "Dudes Habidashery")
      @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48, status: 1) 
      @item2 = @merchant1.items.create!(name: "Football", description: "toy for kids", unit_price: 45, status: 1)
    end
    describe "I see a link to create a new item. when I click on the link," do
      it "I am taken to a form that allows me to add item information." do
        visit merchant_dashboard_index_path(@merchant1.id)
        click_link("New Item")
      end
    end
  end
end