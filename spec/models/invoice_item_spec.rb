require 'rails_helper'

RSpec.describe InvoiceItem do 
  describe 'relationships' do 
    it {should belong_to :item}
    it {should belong_to :invoice}
  end

  # describe 'validations' do 
  #   it {should validate_numericality_of :quantity}
  #   it {should validate_numericality_of :unit_price}
  #   it {should validate_numericality_of :status}
  # end
end