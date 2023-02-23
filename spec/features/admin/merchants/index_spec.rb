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
  end
end