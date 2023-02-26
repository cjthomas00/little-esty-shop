require 'rails_helper' 

RSpec.describe 'Merchant Items new' do
  describe "As a merchant" do
    before :each do
      @merchant1 = Merchant.create!( name: "Dudes Habidashery")
      @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48, status: 1) 
      @item2 = @merchant1.items.create!(name: "Football", description: "toy for kids", unit_price: 45, status: 1)
      visit "/merchants/#{@merchant1.id}/items"
      click_link("New Item")
    end

    describe "I see a link to create a new item. when I click on the link," do
      it "I am taken to a form that allows me to add item information." do
        expect(page).to have_content("Create New Item")
        expect(page).to have_field("Name:")
        expect(page).to have_field("Description:")
        expect(page).to have_field("Price:")
      end

      it "When I fill out the form I click Submit then I am taken back to the items index page and I see the item I just created displayed in the list of items and I see my item was created with a default status of disabled." do
        fill_in "Name", with: "Hockey Stick"
        fill_in "Description", with: "Left-handed stick used for ice hockey"
        fill_in "Price", with: "199"
        click_button("Submit")
        item = Item.last

        expect(current_path).to eq(merchant_items_path(@merchant1))
        within(".disabled_items")  do 
          expect(page).to have_content(item.name)
        end
        within(".enabled_items")  do 
          expect(page).to have_no_content(item.name)
        end
      end
    end
  end
end