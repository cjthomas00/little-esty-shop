class Admin::MerchantsController < ApplicationController 
  def index 
    @merchants = Merchant.all
  end

  def show 
    @merchant = Merchant.find(params[:id])
  end

  def new 
    @merchant = Merchant.new
  end

  def create 
    @merchant = Merchant.create!(new_merchant_attributes)
  end

  def edit 
    @merchant = Merchant.find(params[:id])
  end

  def update 
    merchant = Merchant.find(params[:id])
    if params[:status] 
      merchant.update!(status: params[:status])
      redirect_to "/admin/merchants"
    
    elsif merchant.update!(update_merchant_attributes)
      redirect_to "/admin/merchants/#{merchant.id}"
      flash[:notice] = "Successfully Updated"
    end
  end

  private 
  def update_merchant_attributes
    params.require(:merchant).permit(:name)
  end

  def new_merchant_attributes 
    params.require(:merchant).permit(:name, :status)
  end
end