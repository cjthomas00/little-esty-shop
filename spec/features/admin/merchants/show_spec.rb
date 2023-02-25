require 'rails_helper'

RSpec.describe "Admin Merchants Show Page" do 
  before(:each) do 
    @merchant = FactoryBot.create_list(:merchant, 3)
  end

  describe 'user story 26 - Admin Merchant Update' do 
    it 'when visiting a merchants admit showpage, it has a link to update merchant information' do 
      visit "/admin/merchants/#{@merchant[0].id}"

      expect(page).to have_link("Update Merchant")

    end

    it 'when clicking the link, it redirects to a page to edit the merchant' do 
       visit "/admin/merchants/#{@merchant[0].id}"

       click_link("Update Merchant")

       expect(current_path).to eq("/admin/merchants/#{@merchant[0].id}/edit")
    end

    it 'has a form filled in with existing information' do 
      visit "/admin/merchants/#{@merchant[0].id}"

      click_link("Update Merchant")

      within(".update_merchant_form") do 
        expect(page).to have_field("Name", with: "#{@merchant[0].name}")
      end

    end

    it 'can update information,and click submit - redirects to show page which has updated info and a flash message of success' do 
      visit "/admin/merchants/#{@merchant[0].id}"

      click_link("Update Merchant")

      within(".update_merchant_form") do 
        expect(page).to have_field("Name", with: "#{@merchant[0].name}")
        fill_in("Name", with: "Merchanty Merch Merch")
        click_button("Submit")
      end
      expect(current_path).to eq("/admin/merchants/#{@merchant[0].id}")
      expect(page).to have_content("Merchanty Merch Merch")
      expect(page).to have_content("Successfully Updated")
    end
  end
end