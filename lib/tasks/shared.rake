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
  end
end