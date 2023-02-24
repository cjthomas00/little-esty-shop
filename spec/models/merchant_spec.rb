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
    @merchant1 {Merchant.create!(uuid: 101, name: "Brian's Beads")}
    @customer1 { Customer.create!(uuid: 1, first_name: "Britney", last_name: "Spears")}
    @customer2 { Customer.create!(uuid: 2, first_name: "Bob", last_name: "Smith")}
    @customer3 { Customer.create!(uuid: 3, first_name: "Bill", last_name: "Johnson")}
    (:customer4) { Customer.create!(uuid: 4, first_name: "Boris", last_name: "Nelson")}
    (:customer5) { Customer.create!(uuid: 5, first_name: "Barbara", last_name: "Hilton")}
    (:customer6) { Customer.create!(uuid: 6, first_name: "Bella", last_name: "Thomas")}
    (:invoice1) { @customer1.invoices.create!(uuid: 10, status: 2) }
    (:invoice2) { @customer1.invoices.create!(uuid: 11, status: 2) }
    (:invoice3) { @customer2.invoices.create!(uuid: 12, status: 2) }
    (:invoice4) { @customer2.invoices.create!(uuid: 13, status: 2) }
    (:invoice5) { @customer3.invoices.create!(uuid: 14, status: 2) }
    (:invoice6) { @customer3.invoices.create!(uuid: 15, status: 2) }
    (:invoice7) { customer4.invoices.create!(uuid: 16, status: 2) }
    (:invoice8) { customer5.invoices.create!(uuid: 17, status: 2) }
    (:invoice9) { customer5.invoices.create!(uuid: 18, status: 2) }
    (:invoice10) { customer6.invoices.create!(uuid: 19, status: 2) }
    (:invoice11) { customer6.invoices.create!(uuid: 20, status: 2) }
    (:item1) { @merchant1.items.create!(name: "water bottle", description: "24oz metal container for water", unit_price: 8) }
    (:item2) { @merchant1.items.create!(name: "rubber duck", description: "toy for bath", unit_price: 1) }
    (:item3) { @merchant1.items.create!(name: "lamp", description: "12 inch desk lamp", unit_price: 16) }
    (:item4) { @merchant1.items.create!(name: "wireless mouse", description: "wireless computer mouse for mac", unit_price: 40) }
    (:item5) { @merchant1.items.create!(name: "chapstick", description: "coconut flavor chapstick", unit_price: 2) }
    (:transaction1) {invoice1.transactions.create!(uuid: 1, credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction2) {invoice2.transactions.create!(uuid: 2, credit_card_number: 4654405418249632, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction3) {invoice3.transactions.create!(uuid: 3, credit_card_number: 4140149827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction4) {invoice4.transactions.create!(uuid: 4, credit_card_number: 4140149827486249, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction5) {invoice5.transactions.create!(uuid: 6, credit_card_number: 4763141973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction6) {invoice6.transactions.create!(uuid: 7, credit_card_number: 4763141973880496, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction14) {invoice7.transactions.create!(uuid: 15, credit_card_number: 4504301557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") }
    (:transaction15) {invoice7.transactions.create!(uuid: 16, credit_card_number: 4504301557459341, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction7) {invoice8.transactions.create!(uuid: 8, credit_card_number: 4173081602435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction8) {invoice9.transactions.create!(uuid: 9, credit_card_number: 4173081602435789, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction9) {invoice10.transactions.create!(uuid: 10, credit_card_number: 4972246905754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "failed") }
    (:transaction10) {invoice10.transactions.create!(uuid: 11, credit_card_number: 4972246905754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    (:transaction11) {invoice11.transactions.create!(uuid: 12, credit_card_number: 4972246905754900, credit_card_expiration_date: Date.new(2024, 1, 3), result: "success") }
    end
    it 'top_5_customers_by_transaction' do
      expect(@merchant.first.top_5_customers_by_transaction).to eq([])
    end
  end
end