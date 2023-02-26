class Admin::DashboardsController < ApplicationController
  def index
    @top_five_customers = Customer.top_five_customer
    @incomplete_invoices = Invoice.incomplete_invoices
  end
end