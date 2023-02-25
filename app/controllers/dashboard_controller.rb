class DashboardController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @items_ready_to_ship = Item.ready_to_ship(params[:merchant_id])
  end
end
