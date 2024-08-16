class Sake < ApplicationRecord
  has_many :reviews
  include HTTParty
  base_uri 'https://muro.sakenowa.com/sakenowa-data'  # APIのベースURL

  def self.fetch_and_create_sake
    response = get('/api/brands')

    if response.success?
      response['brands'].each do |sake_data|
        Sake.create(
          sakenowaId: sake_data['id'],
          brand: sake_data['name'],
          brewery: sake_data['breweryId']
          # prefecture: sake_data['prefecture_name']
        )
      end
    else
      Rails.logger.error("Failed to fetch Sake data: #{response.body}")
    end
  end

end
