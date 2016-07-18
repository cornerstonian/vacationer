class DashboardController < ApplicationController

  before_action do
    @current_location = session[:location]

      if @current_location.nil?
        redirect_to new_location_path
      end
  end

  def show

    lat = @current_location["lat"]
    lon = @current_location["lon"]

    url = "https://api.foursquare.com/v2/venues/search?query=schools&ll=#{lat},#{lon}&client_id=O20HBCHF00APBZBEBQJ3GVHDGHJSRXSYI1NOAS0ONTP1UYVK&client_secret=DZ0VRWKBADCTNH3XKHMY4VEB21EJXX1IZH4TNI1R0APSDNB2&v=20160717"

    json = JSON.parse(Http.get(url).body)

    @venues = json["response"]["venues"]
  end
end
