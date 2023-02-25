require 'rails_helper'

RSpec.describe 'Merchant items index', type: :feature do
  describe 'As a merchant' do
    before :each do
      @merchant1 = Merchant.create!( name: "Dudes Habidashery")
      @merchant2 = Merchant.create!( name: "Genreal Store")
      @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48) 
      @item2 = @merchant1.items.create!(name: "football", description: "toy for kids", unit_price: 45) 
      @item3 = @merchant1.items.create!(name: "lamp shade", description: "12 inch desk lamp", unit_price: 18) 
      @item4 = @merchant1.items.create!(name: "wireless keyboard", description: "wireless computer keyboard for mac", unit_price: 40) 
      @item5 = @merchant1.items.create!(name: "chapstick", description: "original flavor chapstick", unit_price: 2)
      @item6 = @merchant2.items.create!(name: "Arctic bottle", description: "24oz metal container for water", unit_price: 48) 
      @item7 = @merchant2.items.create!(name: "Basketball", description: "toy for kids", unit_price: 45) 
      @item8 = @merchant2.items.create!(name: "Window Covering", description: "Window blinds", unit_price: 18) 
      @item9 = @merchant2.items.create!(name: "Wired Mouse", description: "A mouse for a PC", unit_price: 20) 
      @item10 = @merchant2.items.create!(name: "Bubble Gum", description: "original flavor bubble gum", unit_price: 2)
      visit "/merchant/#{@merchant1.id}/items"
    end
    describe "When I visit my merchant items index page (merchants/merchant_id/items)" do
      #user story 6
      it 'I see a list of the names of all of my items and I do not see items for any other merchant' do
        
        expect(page).to have_content("#{@merchant1.name}'s Items")
        expect(page).to have_content(@item1.name)
        expect(page).to have_content(@item2.name)
        expect(page).to have_content(@item3.name)
        expect(page).to have_content(@item4.name)
        expect(page).to have_content(@item5.name)
        expect(page).to have_no_content(@item6.name)
        expect(page).to have_no_content(@item7.name)
        expect(page).to have_no_content(@item8.name)
        expect(page).to have_no_content(@item9.name)
        expect(page).to have_no_content(@item10.name)
      end
    end
  end
end