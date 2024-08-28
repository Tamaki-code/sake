namespace :deploy do
  desc "Import flavor chart data, sake data from Sakenowa API"
  task all: :environment do
    Rake::Task['db:migrate'].invoke
    Rake::Task['import_data'].invoke
    Rake::Task['import_flavor_data'].invoke
  end
end