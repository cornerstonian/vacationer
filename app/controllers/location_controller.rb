require 'cgi'
class LocationController < ApplicationController

  def new
  end

  def locate
    @location = params[:location]

    results = JSON.parse(Http.get("http://locationiq.org/v1/search.php?key=0b4689b45e47c896480d&format=json&q=#{CGI::escape(@location)}").body)

    session[:location] = results.first

    redirect_to root_path
  end


end
