class MerchantInvoicesController < ApplicationController
  def index 
    @merchant = Merchant.find(params[:merchant_id])
    @invoices = @merchant.invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def update
    require 'pry'; binding.pry
    @merchant = Merchant.find(params[:merchant_id])
    @invoice = @merchant.invoices.find(params[:id])
    @invoice.invoice_items.update(invoice_items_params)

    redirect_to merchant_invoice_path(@merchant, @invoice)
  end

  private
  def invoice_items_params
    params.require(:invoice_items).permit(:status)
  end
end