namespace :import do
  desc "Import sake data from Sakenowa API"
  task sake_data: :environment do
    service = SakenowaService.new

    # 地域データの取得とデバッグ出力
    puts "Fetching areas..."
    response = service.fetch_areas  # レスポンス全体を取得
    areas = response['areas']       # 'areas'キーのデータを取り出す
    puts areas.inspect              # デバッグ用に取得したエリアを表示
    areas.each do |area_data|
      Region.upsert({
        sakenowaId: area_data['id'],
        name: area_data['name']
      }, unique_by: :sakenowaId)
    end
    puts "Data import completed."

    # 蔵元データの取得と保存
    puts "Fetching breweries..."
    response = service.fetch_breweries
    breweries = response['breweries']
    puts breweries.inspect 
    breweries.each do |brewery_data|
      region = Region.find_by(sakenowaId: brewery_data['areaId'])
      Brewery.upsert({
        name: brewery_data['name'],
        sakenowa_brewery_id: brewery_data['id'],
        region_id: region.id
      }, unique_by: :sakenowa_brewery_id)
    end
    puts "Data import completed."

    # 銘柄データの取得と保存
    puts "Fetching brands..."
    response = service.fetch_sakes
    sakes = response['brands']
    puts sakes.inspect 
    sakes.each do |sake_data|
      brewery = Brewery.find_by(sakenowa_brewery_id: sake_data['breweryId'])
      Sake.upsert({
        sakenowaId: sake_data['id'],
        name: sake_data['name'],
        brewery_id: brewery.id
      }, unique_by: :sakenowaId)
    end
    puts "Data import completed."
  end
end
