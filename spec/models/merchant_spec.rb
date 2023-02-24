require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
  end

  describe "::enabled_merchants" do 
    it 'is a list of enabled merchants' do 
      disabled_merchant = Merchant.create!(name: "Sock Store", status: 1)
      enabled_merchant_1 = Merchant.create!(name: "Candy Store", status: 0)
      enabled_merchant_2 = Merchant.create!(name: "Hat Store", status: 0)

      expect(Merchant.enabled_merchants).to eq([enabled_merchant_1, enabled_merchant_2])
    end
  end

  describe "::disabled_merchants" do 
    it 'is a list of disabled merchants' do 
      disabled_merchant = Merchant.create!(name: "Sock Store", status: 1)
      enabled_merchant_1 = Merchant.create!(name: "Candy Store", status: 0)
      enabled_merchant_2 = Merchant.create!(name: "Hat Store", status: 0)

      expect(Merchant.disabled_merchants).to eq([disabled_merchant])
    end
  end
end