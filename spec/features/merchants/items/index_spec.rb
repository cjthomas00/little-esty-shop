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
      visit "/merchants/#{@merchant1.id}/items"
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

      #user story 7
      it "When I click on the name of an item from the merchant items index page,
      Then I am taken to that merchant's item's show page (/merchants/merchant_id/items/item_id)" do
        expect(page).to have_link("#{@item1.name}")
        expect(page).to have_link("#{@item2.name}")
        expect(page).to have_link("#{@item3.name}")
        expect(page).to have_link("#{@item4.name}")
        expect(page).to have_link("#{@item5.name}")
        expect(page).to have_no_link("#{@item6.name}")
        expect(page).to have_no_link("#{@item7.name}")
        expect(page).to have_no_link("#{@item8.name}")
        expect(page).to have_no_link("#{@item9.name}")
        expect(page).to have_no_link("#{@item10.name}")
        click_link("#{@item1.name}") 
        expect(current_path).to eq(merchant_item_path(@merchant1, @item1))
      end
    end

    #user story 9
    describe "When I visit my items index page next to each item name I see a button to disable or enable that item" do
      it "When I click this button then I am redirected back to the items index and I see that the items status has changed" do
        within "#item_id-#{@item1.id}" do
        expect(page).to have_content("Item Status: Disabled")
        expect(page).to have_button("Disable")
        expect(page).to have_button("Enable")
        click_button("Enable #{@item1.name}")
        expect(page).to have_content("Item Status: Enabled")
        end
        expect(current_path).to eq(merchant_items_path(@merchant1))
      end
    end
  end
end