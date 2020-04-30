class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def show
    @number_of_products = Product.all.length
    @number_of_categories = Category.all.length
    pp Product.all.length
  end
end
