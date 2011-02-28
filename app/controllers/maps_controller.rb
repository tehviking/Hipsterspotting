class MapsController < ActionController::Base
  layout "application"
  include Geokit::Geocoders
  
  def map
    respond_to :js
    @lat = params[:lat] || "40.536754"
    @lng = params[:lng] || "-111.905797"
    @zoom = params[:zoom] || "10"
  end
  
  def index
  end
  
  def submit_address
    redirect_to "/maps/map", :lat => @lat, :lng => @lng, :layout => nil
    geo = MultiGeocoder.geocode(params[:address])

    @lat = geo.lat
    @lng = geo.lng
  end
end