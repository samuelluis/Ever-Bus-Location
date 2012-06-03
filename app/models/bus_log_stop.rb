class BusLogStop < ActiveRecord::Base
  belongs_to :bus
  belongs_to :bus_stop
  
  def name
    ""
  end
end
