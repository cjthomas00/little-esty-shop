class Admin::InvoicesController < ApplicationController 
  def index 
    @invoices = Invoice.all
  end

  def show
   @invoice = Invoice.find(params[:id])
  end

  def update 
    # require 'pry'; binding.pry
    invoice = Invoice.find(params[:id])
    invoice.update!(update_status)
    redirect_to "/admin/invoices/#{invoice.id}"
  end

  private 
  
  def update_status
    params.require(:invoice).permit(:status)
  end
end