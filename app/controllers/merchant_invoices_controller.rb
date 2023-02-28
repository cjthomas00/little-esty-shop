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
    @merchant = Merchant.find(params[:merchant_id])
    @invoice = Invoice.find(params[:id])

    @invoice_item = InvoiceItem.find(params[:invoice_items][:invoice_item])
    @invoice_item.update(invoice_items_params)

    redirect_to merchant_invoice_path(@merchant, @invoice)
  end

  private
  def invoice_items_params
    params.require(:invoice_items).permit(:status)
  end
end