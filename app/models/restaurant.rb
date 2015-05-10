class Restaurant < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mount_uploader :menu, MenuUploader

  # Elasticsearch mapping settings
  settings do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :rating
      indexes :address, analyzer: 'english'
      indexes :cuisine
      indexes :location, type: 'geo_point'
      indexes :menu, type: 'attachment'
    end
  end

  def as_indexed_json(options={})
    as_json(except: [:lon, :lat, :menu]).merge(
        location: {lat: self.lat, lon: self.lon},
        menu: Base64.encode64(File.open(self.menu.current_path) { |io| io.read }))
  end

end
