require 'rails_helper'

RSpec.describe "Admin Mercnahts Index" do 
  before(:each) do 
    @merchant_1 = Merchant.create!(name: "Joe Bob")
    @merchant_2 = Merchant.create!(name: "Tim Smith")
    @merchant_3 = Merchant.create!(name: "Jane Doe")
  end
  describe 'user story 24' do 
    it 'visits the /admin/merchants index and has the name of each merchant in the system' do 
      visit "/admin/merchants"

      within(".merchant_names") do 
        expect(page).to have_content(@merchant_1.name)
        expect(page).to have_content(@merchant_2.name)
        expect(page).to have_content(@merchant_3.name)
      end
      
    end
  end
end