class Restaurant < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :rating
      indexes :address, analyzer: 'english'
      indexes :cuisine
      indexes :location, type: 'geo_point'
    end
  end

  def as_indexed_json(options={})
    as_json(except: [:lon, :lat]).merge location: {lat: self.lat, lon: self.lon}
  end

end
