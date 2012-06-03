class RouteDetail < ActiveRecord::Base
  belongs_to :route
  has_many :bus_log_stops, :through => :route
  belongs_to :route_branch
  has_many :start_bus_stops, :class_name => "BusStop", :through => :route_branch, :source => :start_bus_stop
  has_many :end_bus_stops, :class_name => "BusStop", :through => :route_branch, :source => :end_bus_stop
  
  def name
    new_record? ? "" : "#{route.name}, #{route_branch.name}"
  end
  
end
