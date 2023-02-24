class Admin::MerchantsController < ApplicationController 
  def index 
    @merchants = Merchant.all
  end

  def show 
    @merchant = Merchant.find(params[:id])
  end

  def edit 
    @merchant = Merchant.find(params[:id])
  end

  def update 
    merchant = Merchant.find(params[:id])
    merchant.update!(update_merchant_attributes)
    redirect_to "/admin/merchants/#{merchant.id}"
    flash[:notice] = "Successfully Updated"
  end

  private 
  def update_merchant_attributes
    params.require(:merchant).permit(:name)
  end
end