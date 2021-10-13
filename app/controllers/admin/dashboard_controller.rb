class Admin::DashboardController < ApplicationController
  def show
    @num_of_category = Category.count
    @num_of_products = Product.count
  end
end
