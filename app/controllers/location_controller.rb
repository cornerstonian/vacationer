require 'cgi'
class LocationController < ApplicationController
  def locate
    @location = params[:location]

    results = JSON.parse(Http.get("http://locationiq.org/v1/search.php?key=5854c01d06bf4833124d&format=json&q=#{CGI::escape(@location)}").body)

    session[:location] = results.first
    redirect_to root_path
  end
end
