class Route < ActiveRecord::Base
  belongs_to :start_bus_stop, :class_name => "BusStop", :foreign_key => "start_bus_stop_id"
  belongs_to :end_bus_stop, :class_name => "BusStop", :foreign_key => "end_bus_stop_id"
  belongs_to :company
  has_many :buses
  has_many :bus_log_stops, :through => :buses
  has_many :bus_stops, :through => :bus_log_stops
  has_many :route_details
end
