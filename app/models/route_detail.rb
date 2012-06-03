class RouteDetail < ActiveRecord::Base
  belongs_to :route
  belongs_to :route_branch
  
  def name
    "#{route.name}, #{route_branch.name}"
  end
  
end
