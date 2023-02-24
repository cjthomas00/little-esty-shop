class Merchant < ApplicationRecord
  has_many :items

  enum status: ["Enabled", "Disabled"]

  def self.enabled_merchants 
    where(status: 0)
  end

  def self.disabled_merchants 
    where(status: 1)
  end
end