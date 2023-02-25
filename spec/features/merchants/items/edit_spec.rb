require 'rails_helper' 

RSpec.describe " Merchant Item Update", type: :feature do
  describe "When I click the link" do 
    before :each do 
      @merchant1 = Merchant.create!( name: "Dudes Habidashery")
      @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48)
      visit "/merchant/#{@merchant1.id}/items/#{@item1.id}"
    end
    # user story 8
    describe "Then I am taken to a page to edit this item" do
      it "And I see a form filled in with the existing item attribute information" do
        click_link("Update Item")
        expect(current_path).to eq("/merchant/#{@merchant1.id}/items/#{@item1.id}/edit")
        expect(page).to have_field("Name", with: "#{@item1.name}")
        expect(page).to have_field("Description", with: "#{@item1.description}")
        expect(page).to have_field("Price", with: "#{@item1.unit_price}")
        expect(page).to have_button "Submit"
      end

      it "When I update the information in the form and I click submit then I am redirected back to the item show page where I see the updated information And I see a flash message stating that the information has been successfully updated."  do
        click_link("Update Item")
        expect(current_path).to eq("/merchant/#{@merchant1.id}/items/#{@item1.id}/edit")
        expect(page).to have_field("Name", with: "#{@item1.name}")

        fill_in("Name", with: "Knockoff Yeti")
        click_button("Submit")
        expect(current_path).to eq("/merchant/#{@merchant1.id}/items/#{@item1.id}")
        expect(page).to have_content("Knockoff Yeti")
        expect(page).to have_content("Successfully Updated")
      end
    end
  end
end