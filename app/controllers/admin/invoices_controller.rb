class Admin::InvoicesController < ApplicationController 
  def index 
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
    @inv_items = @invoice.invoice_items
  end
end