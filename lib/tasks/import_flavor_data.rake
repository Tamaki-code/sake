namespace :import do
  desc "Import flavor chart data from Sakenowa API"
  task flavor_data: :environment do
    service = SakenowaService.new

    puts "Fetching flavor charts..."
    response = service.fetch_flavor_charts
    flavor_charts = response['flavorCharts']
    puts flavor_charts.inspect
    
    flavor_charts.each do |flavor_data|
      sake = Sake.find_by(sakenowaId: flavor_data['brandId'])
      next unless sake

      FlavorChart.create!(
        sakenowaBrandId: sake.sakenowaId,
        f1: flavor_data['f1'],
        f2: flavor_data['f2'],
        f3: flavor_data['f3'],
        f4: flavor_data['f4'],
        f5: flavor_data['f5'],
        f6: flavor_data['f6'],
      )
    end

    puts "Flavor chart data import completed."
  end
end
