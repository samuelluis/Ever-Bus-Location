class BusStop < ActiveRecord::Base
  belongs_to :city
  has_many :bus_log_stops
end
