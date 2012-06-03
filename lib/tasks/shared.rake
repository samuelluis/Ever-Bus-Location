namespace :db do
  
  task :countries => :environment do
    CSV.foreach(ENV['countries']||"lib/csv/countries.csv", {:col_sep => ","}) do |row|
      Country.create(:name => row[0], :alias => row[2])
    end
  end
  
  task :development => :environment do
    desc "Set DB with development data"
    %w(migrate countries seed).each do |task|
      puts "Task :: #{task}"
      Rake::Task["db:#{task}"].invoke
    end
    
    # encoding: utf-8
    City.create([
      {:name => "Santo Domingo", :alias => "SD", :country_id => Country.find_by_name("Dominican Republic").id},
      {:name => "Distrito Nacional", :alias => "DN", :country_id => Country.find_by_name("Dominican Republic").id},
      {:name => "Santiago", :alias => "ST", :country_id => Country.find_by_name("Dominican Republic").id},
      {:name => "Miami", :alias => "MIA", :country_id => Country.find_by_name("United States Of America").id},
      {:name => "Pennsylvania", :alias => "PEN", :country_id => Country.find_by_name("United States Of America").id}
    ])

    Company.create([
      {:name => "Oficina Metropolitana de Servicios de Autobuses", :alias => "OMSA", :city_id => City.first.id},
      {:name => "Oficina Para el Reordenamiento del Transporte", :alias => "OPRET", :city_id => City.first.id}
    ])

    User.create([
      {:email => "samuelluis@omsa.com", :password => "password", :company_id => Company.first.id},
      {:email => "jorwan@omsa.com", :password => "password", :company_id => Company.first.id},
      {:email => "samuelluis@opret.com", :password => "password", :company_id => Company.last.id},
      {:email => "jorwan@opret.com", :password => "password", :company_id => Company.last.id}
    ])

    BusStop.create([
      {:name => "Mama Tingo", :latitude => 18.546836, :longitude => -69.90077, :city_id => City.first.id},
      {:name => "Gregorio Urbano Gilber", :latitude => 18.540367, :longitude => -69.904718, :city_id => City.first.id},
      {:name => "Gregorio Luperón", :latitude => 18.529503, :longitude => -69.908624, :city_id => City.first.id},
      {:name => "José Francisco Peña Gómez", :latitude => 18.525149, :longitude => -69.916348, :city_id => City.first.id},
      {:name => "Hermanas Mirabal", :latitude => 18.518353, :longitude => -69.914761, :city_id => City.first.id},
      {:name => "Máximo Gómez", :latitude => 18.509686, :longitude => -69.91549, :city_id => City.first.id},
      {:name => "Los Tainos", :latitude => 18.499471, :longitude => -69.915404, :city_id => City.first.id},
      {:name => "Pedro Livio Cedeño", :latitude => 18.493325, :longitude => -69.914804, :city_id => City.first.id},
      {:name => "Peña Battle", :latitude => 18.48547, :longitude => -69.91446, :city_id => City.first.id},
      {:name => "Juan Pablo Duarte", :latitude => 18.481319, :longitude => -69.914374, :city_id => City.first.id},
      {:name => "Profesor Juan Bosch", :latitude => 18.476719, :longitude => -69.913816, :city_id => City.first.id},
      {:name => "Casandra Damirón", :latitude => 18.471183, :longitude => -69.912057, :city_id => City.first.id},
      {:name => "Joaquín Balaguer", :latitude => 18.464304, :longitude => -69.909611, :city_id => City.first.id},
      {:name => "Amin Abel", :latitude => 18.459175, :longitude => -69.91667, :city_id => City.first.id},
      {:name => "Francisco Alberto Caamaño", :latitude => 18.455817, :longitude => -69.923601, :city_id => City.first.id},
      {:name => "Centro de los Héroes", :latitude => 18.450993, :longitude => -69.927399, :city_id => City.first.id}
    ])

    Route.create([
      {:name => "Metro de Santo Domingo - L1", :start_bus_stop_id => BusStop.first.id, :end_bus_stop_id => BusStop.last.id, :company_id => Company.find_by_alias("OPRET").id}
    ])

    BusStop.all.each do |bs|
      if bs.id != BusStop.last.id
        seconds = rand(60).to_i
        RouteBranch.create([
          {:start_bus_stop_id => bs.id, :end_bus_stop_id => bs.id+1, :travel_time => "00:02:#{(seconds<10) ? "0"+seconds.to_s : seconds.to_s}"}
        ])
      end
    end

    RouteBranch.all.each do |rb|
      RouteDetail.create([
        {:position_order => rb.id, :is_going => true, :route_id => Route.first.id, :route_branch_id => rb.id},
        {:position_order => RouteBranch.count-(rb.id-1), :is_going => false, :route_id => Route.first.id, :route_branch_id => rb.id}
      ])
    end

    def rchar
      ("A".."Z").to_a[rand(("A".."Z").to_a.size)]
    end

    (rand(6)+4).times do |i|
      Bus.create(:name => "Unit #{i+1}", :code => rand(9).to_s+rand(9).to_s+rchar+rchar+rchar+rchar+rand(9).to_s+rchar, :company_id => Company.find_by_alias("OPRET").id, :route_id => Route.first.id)
    end
    
  end
end