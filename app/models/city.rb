class City < ActiveRecord::Base
  belongs_to :country
  has_many :companies
  has_many :bus_stops
end
