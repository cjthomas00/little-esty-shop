class MerchantItemsController < ApplicationController
  def index 
    @merchant = Merchant.find(params[:merchant_id])
    @items = @merchant.items
  end

  def show
    @item = Item.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def edit 
    @item = Item.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def update
    item = Item.find(params[:id])
    item.update!(update_item_attributes)
    item.save 
    merchant = Merchant.find(params[:merchant_id])

    redirect_to "/merchant/#{merchant.id}/items/#{item.id}"
    flash[:notice] = "Successfully Updated"
  end

  private
  def update_item_attributes
    params.require(:item).permit(:name, :description, :unit_price)
  end
end