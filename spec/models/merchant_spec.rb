require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
    it { should have_many(:invoice_items).through(:items)}
    it { should have_many(:invoices).through(:invoice_items)}
    it { should have_many(:transactions).through(:invoices)}
    it { should have_many(:customers).through(:invoices)}
  end

  describe 'Instance Methods' do
    before :each do
      @merchant1 = Merchant.create!( name: "Dudes Habidashery")
      @merchant2 = Merchant.create!( name: "Dudes Not Habidashery")
      @merchant3 = Merchant.create!( name: "Merchany Margery")
      @merchant4 = Merchant.create!( name: "Hello McHey")
      @merchant5 = Merchant.create!( name: "Things McGee")
      @merchant6 = Merchant.create!( name: "Fred Freddy")
      
      @customer1 = Customer.create!( first_name: "Britney", last_name: "Johnson")
      @customer2 = Customer.create!( first_name: "Mike", last_name: "Smith")
      @customer3 = Customer.create!( first_name: "Brian", last_name: "Johnson")
      @customer4 = Customer.create!( first_name: "Clark", last_name: "Griswold")
      @customer5 = Customer.create!( first_name: "Nick", last_name: "Green")
      @customer6 = Customer.create!( first_name: "Lyla", last_name: "Thomas")

      @invoice1 = @customer1.invoices.create!( status: 1) 
      @invoice2 = @customer1.invoices.create!( status: 1) 
      @invoice3 = @customer2.invoices.create!( status: 1) 
      @invoice4 = @customer2.invoices.create!( status: 1) 
      @invoice5 = @customer3.invoices.create!( status: 1) 
      @invoice6 = @customer3.invoices.create!( status: 1) 
      @invoice7 = @customer4.invoices.create!( status: 1) 
      @invoice8 = @customer5.invoices.create!( status: 1) 
      @invoice9 = @customer5.invoices.create!( status: 1) 
      @invoice10 = @customer6.invoices.create!( status: 1) 
      @invoice11 = @customer6.invoices.create!( status: 1) 
      @invoice12 = @customer1.invoices.create!( status: 1) 
      @invoice13 = @customer2.invoices.create!( status: 1) 
      @invoice14 = @customer2.invoices.create!( status: 1) 
      @invoice15 = @customer3.invoices.create!( status: 1) 
      @invoice16 = @customer3.invoices.create!( status: 1) 
      @invoice17 = @customer4.invoices.create!( status: 1) 
      @invoice18 = @customer5.invoices.create!( status: 1) 
      @invoice19 = @customer5.invoices.create!( status: 1) 
      @invoice20 = @customer6.invoices.create!( status: 1) 

      @item1 = @merchant1.items.create!(name: "Yeti bottle", description: "24oz metal container for water", unit_price: 48, status: 1) 
      @item2 = @merchant1.items.create!(name: "Football", description: "toy for kids", unit_price: 45, status: 1) 
      @item3 = @merchant1.items.create!(name: "Lamp shade", description: "12 inch desk lamp", unit_price: 18, status: 1) 
      @item4 = @merchant1.items.create!(name: "Wireless keyboard", description: "wireless computer keyboard for mac", unit_price: 40, status: 0) 
      @item5 = @merchant1.items.create!(name: "Chapstick", description: "original flavor chapstick", unit_price: 2, status: 0)
      @item6 = @merchant1.items.create!(name: "Arctic bottle", description: "24oz metal container for water", unit_price: 48, status: 1) 
      @item7 = @merchant1.items.create!(name: "Basketball", description: "toy for kids", unit_price: 45, status: 0) 
      @item8 = @merchant1.items.create!(name: "Window Covering", description: "Window blinds", unit_price: 18, status: 1) 
      @item9 = @merchant1.items.create!(name: "Wired Mouse", description: "A mouse for a PC", unit_price: 20, status: 0) 
      @item10 = @merchant1.items.create!(name: "Bubble Gum", description: "original flavor bubble gum", unit_price: 2, status: 1)
      @item11 = @merchant2.items.create!(name: "Yeti", description: "idk but it says yeti", unit_price: 48, status: 1) 
      @item12 = @merchant2.items.create!(name: "Can", description: "a can", unit_price: 12, status: 1) 
      @item13 = @merchant3.items.create!(name: "Bean", description: "just one bean", unit_price: 10, status: 1) 
      @item14 = @merchant3.items.create!(name: "Snack", description: "delicious treat for meeee", unit_price: 15, status: 1) 
      @item15 = @merchant4.items.create!(name: "Couch", description: "potato", unit_price: 60, status: 1) 
      @item16 = @merchant4.items.create!(name: "Computer", description: "what i am typing this on", unit_price: 80, status: 1) 
      @item17 = @merchant5.items.create!(name: "Dominoes", description: "knock em over. oh boy, physics!", unit_price: 20, status: 1) 
      @item18 = @merchant5.items.create!(name: "Cards", description: "cards r for card games", unit_price: 15, status: 1) 
      @item19 = @merchant5.items.create!(name: "Tire", description: "vroom vroom tires go spinny spin", unit_price: 80, status: 1) 
      @item20 = @merchant6.items.create!(name: "Boat", description: "a boat", unit_price: 90, status: 1) 
      @item21 = @merchant6.items.create!(name: "Berries", description: "its berries", unit_price: 12, status: 1) 
      @item22 = @merchant6.items.create!(name: "Tissues", description: "they are tissues", unit_price: 10, status: 1) 
  
      @transaction1 = @invoice1.transactions.create!(  credit_card_number: 4626585418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction2 = @invoice2.transactions.create!(  credit_card_number: 4626585418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction3 = @invoice3.transactions.create!(  credit_card_number: 4178259827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction4 = @invoice4.transactions.create!(  credit_card_number: 4178259827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction5 = @invoice5.transactions.create!(  credit_card_number: 4736981973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction6 = @invoice6.transactions.create!(  credit_card_number: 4736981973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction14 = @invoice7.transactions.create!( credit_card_number: 4504656557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") 
      @transaction15 = @invoice7.transactions.create!( credit_card_number: 4504656557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction7 = @invoice8.transactions.create!(  credit_card_number: 4173450892435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction8 = @invoice9.transactions.create!( credit_card_number: 4173045289435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction9 = @invoice10.transactions.create!( credit_card_number: 4956246926754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") 
      @transaction10 = @invoice10.transactions.create!( credit_card_number: 4956246926754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction11 = @invoice11.transactions.create!( credit_card_number: 4956246926754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction12 = @invoice12.transactions.create!(  credit_card_number: 4626585418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction13 = @invoice13.transactions.create!(  credit_card_number: 4178259827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction24 = @invoice14.transactions.create!(  credit_card_number: 4178259827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction25 = @invoice15.transactions.create!(  credit_card_number: 4736981973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction16 = @invoice16.transactions.create!(  credit_card_number: 4736981973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction17 = @invoice17.transactions.create!( credit_card_number: 4504656557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") 
      @transaction18 = @invoice17.transactions.create!( credit_card_number: 4504656557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction19 = @invoice18.transactions.create!(  credit_card_number: 4173450892435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction20 = @invoice19.transactions.create!( credit_card_number: 4173045289435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
      @transaction21 = @invoice20.transactions.create!( credit_card_number: 4956246926754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") 
      @transaction22 = @invoice20.transactions.create!( credit_card_number: 4956246926754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") 
  
      InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 11, unit_price: @item1.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item1.id, invoice_id: @invoice3.id, quantity: 12, unit_price: @item1.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice5.id, quantity: 21, unit_price: @item2.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item3.id, invoice_id: @invoice7.id, quantity: 111, unit_price: @item3.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item6.id, invoice_id: @invoice9.id, quantity: 31, unit_price: @item4.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item5.id, invoice_id: @invoice11.id, quantity: 13, unit_price: @item1.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 1, unit_price: @item2.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item11.id, invoice_id: @invoice12.id, quantity: 11, unit_price: @item11.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item12.id, invoice_id: @invoice13.id, quantity: 11, unit_price: @item12.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item13.id, invoice_id: @invoice14.id, quantity: 11, unit_price: @item13.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item14.id, invoice_id: @invoice15.id, quantity: 11, unit_price: @item14.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item15.id, invoice_id: @invoice16.id, quantity: 11, unit_price: @item15.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item16.id, invoice_id: @invoice17.id, quantity: 11, unit_price: @item16.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item17.id, invoice_id: @invoice18.id, quantity: 11, unit_price: @item17.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item18.id, invoice_id: @invoice19.id, quantity: 11, unit_price: @item18.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item19.id, invoice_id: @invoice20.id, quantity: 11, unit_price: @item19.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item20.id, invoice_id: @invoice12.id, quantity: 11, unit_price: @item20.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item21.id, invoice_id: @invoice13.id, quantity: 11, unit_price: @item21.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item22.id, invoice_id: @invoice14.id, quantity: 11, unit_price: @item22.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item12.id, invoice_id: @invoice15.id, quantity: 11, unit_price: @item12.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item13.id, invoice_id: @invoice16.id, quantity: 11, unit_price: @item13.unit_price, status: 1)
      InvoiceItem.create!(item_id: @item14.id, invoice_id: @invoice17.id, quantity: 11, unit_price: @item14.unit_price, status: 1)
    end
    
      it 'top_5_customers_by_transaction' do
        expect(@merchant1.top_5_customers_by_transaction).to eq([@customer2, @customer3, @customer5, @customer1, @customer6])
      end

      it 'is the top 5 merchants by revenue' do 
        expect(Merchant.top_5_merchants_by_revenue).to eq([@merchant1, @merchant4, @merchant5, @merchant6, @merchant2])
      end

      it 'is the total revenue generated for a merchant' do 
        expect(@merchant1.total_revenue).to eq(7954)
        expect(@merchant2.total_revenue).to eq(792)
      end
    end

  describe "::enabled_merchants" do 
    it 'is a list of enabled merchants' do 
      disabled_merchant = Merchant.create!(name: "Sock Store", status: 0)
      enabled_merchant_1 = Merchant.create!(name: "Candy Store", status: 1)
      enabled_merchant_2 = Merchant.create!(name: "Hat Store", status: 1)

      expect(Merchant.enabled_merchants).to eq([enabled_merchant_1, enabled_merchant_2])
    end
  end

  describe "::disabled_merchants" do 
    it 'is a list of disabled merchants' do 
      disabled_merchant = Merchant.create!(name: "Sock Store", status: 0)
      enabled_merchant_1 = Merchant.create!(name: "Candy Store", status: 1)
      enabled_merchant_2 = Merchant.create!(name: "Hat Store", status: 1)

      expect(Merchant.disabled_merchants).to eq([disabled_merchant])
    end
  end

  # describe "::top_5_merchants_by_revenue" do 
  #   it 'is the top 5 merchants by revenue' do 
  #     expect(Merchant.top_5_merchants_by_revenue).to eq([@merchant1, @merchant2, @merchant3, @merchant4, @merchant5])
  #   end
  # end
end