class Bus < ActiveRecord::Base
  belongs_to :company
  belongs_to :route
  has_many :bus_log_stops
end
