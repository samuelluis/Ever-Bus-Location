class PublicController < ApplicationController
  def index
    
  end
  
  def filter
    #params[:country_id]
    #params[:city_id]
    is_going = (params[:is_going].to_i != 0)
    company = Company.find(params[:company_id].to_i)
    route = Route.find(params[:route_id].to_i)
    bus_stop = BusStop.find(params[:bus_stop_id].to_i)
    
    #BusLogStop.where{ (bus >> company.buses.map{|b| b.id}) & (bus_stop_id = bus_stop.id) & () }
    
    render :text => "Hola mundo"
  end

end
