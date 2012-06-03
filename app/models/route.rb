class Route < ActiveRecord::Base
  belongs_to :start_bus_stop, :class_name => "BusStop", :foreign_key => "start_bus_stop_id"
  belongs_to :end_bus_stop, :class_name => "BusStop", :foreign_key => "end_bus_stop_id"
  belongs_to :company
  has_many :buses
  has_many :bus_log_stops, :through => :buses
  has_many :bus_stops, :through => :bus_log_stops
  has_many :route_details
  has_many :route_branches, :through => :route_details
  has_many :start_bus_stops, :class_name => "BusStop", :through => :route_branches, :source => :start_bus_stop
  has_many :end_bus_stops, :class_name => "BusStop", :through => :route_branches, :source => :end_bus_stop
end
