require 'rails_helper'

RSpec.describe "Admin Mercnahts Index" do 
  before(:each) do 
    @merchant = FactoryBot.create_list(:merchant, 3)
  end
     
  describe 'user story 24' do 
    it 'visits the /admin/merchants index and has the name of each merchant in the system' do 
      visit "/admin/merchants"

      within(".merchant_names") do 
        expect(page).to have_content(@merchant[0].name)
        expect(page).to have_content(@merchant[1].name)
        expect(page).to have_content(@merchant[2].name)

        expect(page).to have_link(@merchant[0].name)
        expect(page).to have_link(@merchant[1].name)
        expect(page).to have_link(@merchant[2].name)
      end
    end

    it 'has links for each merchant name and can go to that merchants show page' do 
      visit "/admin/merchants"
       within(".merchant_names") do 

        expect(page).to have_link(@merchant[0].name)
        expect(page).to have_link(@merchant[1].name)
        expect(page).to have_link(@merchant[2].name)
 
        click_link(@merchant[0].name)
        expect(current_path).to eq("/admin/merchants/#{@merchant[0].id}")
      end
    end

    it 'has a button to disable or enable the merchant' do 
      visit "/admin/merchants" 

      within("#enabled_merchant_id#{@merchant[0].id}") do 
        expect(page).to have_button("Disable")
      end
    end

    it 'when enable/disable is clicked, it redirects to admin merchants index and see that the merchants status is changed' do 
      visit "/admin/merchants" 

      within("#enabled_merchant_id#{@merchant[0].id}") do 
        expect(page).to have_button("Disable")
        click_button("Disable")
      end
      expect(current_path).to eq("/admin/merchants")
      within(".merchant_names") do 
        
        expect(page).to have_content("Status: Disabled")
      end
    end

    it 'has a section for disabled merchants and enabled merchants' do 
      disabled_merchant = Merchant.create!(name: "Sock Store", status: 1)
      enabled_merchant_1 = Merchant.create!(name: "Candy Store", status: 0)
      enabled_merchant_2 = Merchant.create!(name: "Hat Store", status: 0)

      visit "admin/merchants"

      within(".merchant_names") do 
        expect(page).to have_content(enabled_merchant_1.name)
        expect(page).to have_content(enabled_merchant_2.name)
        expect(page).to have_content(disabled_merchant.name)
      end

      within(".enabled_merchants") do 
        expect(page).to have_content(enabled_merchant_1.name)
        expect(page).to have_content(enabled_merchant_2.name)
        expect(page).to_not have_content(disabled_merchant.name)
      end

      within(".disabled_merchants") do 
        expect(page).to have_content(disabled_merchant.name)
        expect(page).to_not have_content(enabled_merchant_1.name)
        expect(page).to_not have_content(enabled_merchant_2.name)
      end
    end
  end
end