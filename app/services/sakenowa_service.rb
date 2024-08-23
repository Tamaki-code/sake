class SakenowaService
  include HTTParty
  base_uri 'https://muro.sakenowa.com/sakenowa-data/api'

  def fetch_areas
    self.class.get('/areas')
  end

  def fetch_breweries
    self.class.get('/breweries')
  end

  def fetch_sakes
    self.class.get('/brands')
  end
end
