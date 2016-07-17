class DashboardController < ApplicationController
  def show
    @current_location = session[:location]
  end
end
