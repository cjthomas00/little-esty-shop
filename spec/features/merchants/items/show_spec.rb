require 'rails_helper'

RSpec.describe 'Merchant items index', type: :feature do
  describe 'As a merchant' do
    before :each do
      @merchant1 = Merchant.create!( name: "Dudes Habidashery")
      @merchant2 = Merchant.create!( name: "Genreal Store")
      @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48) 
      @item2 = @merchant1.items.create!(name: "Football", description: "toy for kids", unit_price: 45) 
      @item3 = @merchant1.items.create!(name: "Lamp shade", description: "12 inch desk lamp", unit_price: 18) 
      @item4 = @merchant1.items.create!(name: "Wireless keyboard", description: "wireless computer keyboard for mac", unit_price: 40) 
      @item5 = @merchant1.items.create!(name: "Chapstick", description: "original flavor chapstick", unit_price: 2)
      @item6 = @merchant2.items.create!(name: "Arctic bottle", description: "24oz metal container for water", unit_price: 48) 
      @item7 = @merchant2.items.create!(name: "Basketball", description: "toy for kids", unit_price: 45) 
      @item8 = @merchant2.items.create!(name: "Window Covering", description: "Window blinds", unit_price: 18) 
      @item9 = @merchant2.items.create!(name: "Wired Mouse", description: "A mouse for a PC", unit_price: 20) 
      @item10 = @merchant2.items.create!(name: "Bubble Gum", description: "original flavor bubble gum", unit_price: 2)
      visit "/merchant/#{@merchant1.id}/items/#{@item1.id}"
    end
    describe "When I click on the name of an item from the merchant items index page, then I am taken to that merchant's item's show page (/merchants/merchant_id/items/item_id)" do
      it "And I see all of the item's attributes including: - Name - Description - Current Selling Price" do
        expect(current_path).to eq("/merchant/#{@merchant1.id}/items/#{@item1.id}")
        expect(page).to have_content(@item1.name)
        expect(page).to have_content(@item1.description)
        expect(page).to have_content(@item1.unit_price)
      end
    end
  end
end