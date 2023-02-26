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
    merchant = Merchant.find(params[:merchant_id])
    if params[:status]
      item.update!(status:params[:status])
      redirect_to merchant_items_path(merchant)
    elsif
      item.update!(update_item_attributes)
      item.save 
      redirect_to merchant_item_path(merchant, item)
      flash[:notice] = "Successfully Updated"
    end
  end

  private
  def update_item_attributes
    params.require(:item).permit(:name, :description, :unit_price, :status)
  end
end