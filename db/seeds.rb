# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.create([
  {:name => "Santo Domingo", :alias => "SD", :country_id => Country.find_by_name("Dominican Republic").id},
  {:name => "Distrito Nacional", :alias => "DN", :country_id => Country.find_by_name("Dominican Republic").id},
  {:name => "Santiago", :alias => "ST", :country_id => Country.find_by_name("Dominican Republic").id},
  {:name => "Miami", :alias => "MIA", :country_id => Country.find_by_name("United States Of America").id},
  {:name => "Pennsylvania", :alias => "PEN", :country_id => Country.find_by_name("United States Of America").id}
])

Company.create([
  {:name => "Oficina Metropolitana de Servicios de Autobuses", :alias => "OMSA", :city_id => City.first.id}
])

User.create([
  {:email => "samuelluis@omsa.com", :password => "password", :company_id => Company.first.id},
  {:email => "jorwan@omsa.com", :password => "password", :company_id => Company.first.id}
])