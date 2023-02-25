require 'rails_helper'

RSpec.describe "Admin Mercnahts New" do 
  before(:each) do 
    @merchant = FactoryBot.create_list(:merchant, 3)
  end 

  describe 'User Story 29 - Admin Merchant Create' do 
    it 'has a form to add merchant information, and redirects to admin merchants after sumbitting' do 
      visit new_admin_merchant_path 
  
      expect(page).to have_content("Create a New Merchant")

      within(".new_merchant_form") do 
        fill_in("Name", with: "New Merchy Merch")
        click_button("Submit")
        expect(current_path).to eq(admin_merchants_path)
      end
    end

    it 'adds the merchant with a default sttus of disabled' do 
      visit new_admin_merchant_path 
  
      expect(page).to have_content("Create a New Merchant")

      within(".new_merchant_form") do 
        fill_in("Name", with: "New Merchy Merch")
        click_button("Submit")
        expect(current_path).to eq(admin_merchants_path)
      end
      new_merchant = Merchant.all.last
      
      visit admin_merchants_path 

      within(".enabled_merchants") do 
        expect(page).to_not have_content(new_merchant.name)
      end

      within(".disabled_merchants") do 
        expect(page).to have_content(new_merchant.name)
      end
    end
  end
end