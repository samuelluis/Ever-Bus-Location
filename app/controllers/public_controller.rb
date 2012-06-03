class PublicController < ApplicationController
  def index
    
  end
  
  def filter
    is_going = (params[:is_going].to_i != 0)
    company = Company.find(params[:company_id].to_i)
    route = Route.find(params[:route_id].to_i)
    bus_stop = BusStop.find(params[:bus_stop_id].to_i)
    route_detail = nil
    
    RouteDetail.where(:route_id => route.id, :is_going => is_going).each do |rd|
      if is_going
        route_detail = rd if rd.start_bus_stops.include? bus_stop
      else
        route_detail = rd if rd.end_bus_stops.include? bus_stop
      end
      break if route_detail
    end
    
    route_details = route.route_details.where(:is_going => is_going).where{(position_order < route_detail.position_order)}
    bus_stops = route_details.map{|rd| (is_going) ? rd.start_bus_stops : rd.end_bus_stops }.flatten
    bus_log_stops = BusLogStop.where(:bus_stop_id => bus_stops.map{|bs| bs.id})
    
    log = bus_log_stops.last
    
    time = log.created_at.in_time_zone("Eastern Time (US & Canada)")
    travel_time = route_detail.route_branch.travel_time
    travel_time = travel_time.hour*60*60 + travel_time.min*60 + travel_time.sec
    
    text = ("<div id='message'>
              <div id='bus_name_div'>
                <label>
                  <b>Bus name: </b><span id='bus_name'>#{log.bus.name}</span>
                </label>
              </div>
              <div id='last_stop_bus_div'>
                <label>
                  <b>Last bus stop: </b><span id='last_stop_bus'>#{log.bus_stop.name}</span>
                </label>
              </div>
              <div id='at_time_div'>
                <label>
                  <b>At time: </b><span id='at_time'>#{log.created_at.in_time_zone("Eastern Time (US & Canada)").strftime("%I:%M:%S %p")}</span>
                </label>
              </div>
              <div id='supposed_arrival_time_div'>
                <label>
                  <b>Suppose arrival time: </b><span id='supposed_arrival_time'>#{reminder(time, travel_time).strftime("%I:%M:%S %p")}</span>
                </label>
              </div>
            </div>").html_safe
    
    render :text => text
  end
  
  def reminder(time, travel_time)
    (time + travel_time.seconds)
  end
end
