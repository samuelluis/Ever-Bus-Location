class RouteBranch < ActiveRecord::Base
  belongs_to :start_bus_stop, :class_name => "BusStop", :foreign_key => "start_bus_stop_id"
  belongs_to :end_bus_stop, :class_name => "BusStop", :foreign_key => "end_bus_stop_id"
  has_many :route_details
  
  def name
    new_record? ? "" : "#{start_bus_stop.name} - #{end_bus_stop.name}"
  end
  
end
