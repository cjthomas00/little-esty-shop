# 32. Admin Invoices Index Page

# As an admin,
# When I visit the admin Invoices index ("/admin/invoices")
# Then I see a list of all Invoice ids in the system
# Each id links to the admin invoice show page

# require 'rails_helper'

# describe 'admin invoice index page' do
#   before :each do 
#     # @merchant = FactoryBot.create_list(:merchant, 1)
#     # @customer = @merchant = FactoryBot.create_list(:customer, 1)
#     # @invoice = FactoryBot.create_list(:invoice, 3, :merchant, :customer)
#     @invoice = FactoryBot.create_list(:invoice, 3)
#   end

#   describe 'user story 32' do
#     it 'displays a list of all Invoice ids in the system' do
#       visit admin_invoices_path 

#       within('#invoices') do
#         expect(page).to have_content("#{@invoice[1].id}")
#         expect(page).to have_content("#{@invoice[2].id}")
#         expect(page).to have_content("#{@invoice[3].id}")
#       end  
#     end

#     it 'displays each id links to the admin invoice show page' do
#       visit admin_invoices_path 

#       within('#invoices') do
#         expect(page).to have_link("#{@invoice[1].id}")
#         expect(page).to have_link("#{@invoice[2].id}")
#         expect(page).to have_link("#{@invoice[3].id}")
#       end 

#       within("#invoices") do 
#         click_link("#{@invoice[1].id}")
        
#         expect(current_path).to eq(admin_show_path("#{@invoice[1].id}"))
#       end
#     end
#   end
# end  