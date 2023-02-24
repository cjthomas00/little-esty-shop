class Admin::DashboardsController < ApplicationController
  def index
    @top_five_customers = Customer.top_5_customers_with_success
  end
end