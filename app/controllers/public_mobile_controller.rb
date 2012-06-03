class PublicMobileController < ApplicationController
  def index
  end

  def getCountries
    render :text => ActiveSupport::JSON.encode(Country.all)
  end

  def getCities
    cities = []
    cities = City.where(:country_id => params[:country_id]) if !params[:country_id].empty?
    render :text => ActiveSupport::JSON.encode(cities)
  end

  def getCompanies
    companies = []
    companies = Company.where(:city_id => params[:city_id]) if !params[:city_id].empty? 
    render :text => ActiveSupport::JSON.encode(companies)
  end

  def getRoutes
    routes = []
    routes = Route.where(:company_id => params[:company_id]) if !params[:company_id].empty?
    options = ""
    routes.each do |route|
      options += "<option going='1' value='#{route.id}'>#{route.name}, #{route.start_bus_stop.name} - #{route.end_bus_stop.name}</option>"+
                 "<option going='0' value='#{route.id}'>#{route.name}, #{route.end_bus_stop.name} - #{route.start_bus_stop.name}</option>"
    end
    render :text => options
  end

  def getBusStops
    bus_stops = []
    bus_stops = RouteDetail.where(:route_id => params[:route_id]).collect{|rd| bus_stops << (params[:is_going]=="1") ? rd.start_bus_stops : rd.end_bus_stops }.flatten
    
    options = ""

    bus_stops.each do |bus|
      options += "<option value='#{bus.id}'>#{bus.name}</option>"
    end

    render :text => options
  end
  
end
