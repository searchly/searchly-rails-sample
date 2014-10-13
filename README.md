# Searchly Sample Rails Application


# Connection Settings

Please see development.rb and production.rb for Elasticsearch connection url settings.

```ruby

elasticsearch_url = ENV['SEARCHBOX_URL'] || ENV['SEARCHLY_URL'] ||
      JSON.parse(ENV['VCAP_SERVICES']['searchly'][0]['credentials']['uri']) || 'http://site:xyz-searchly.com'

  Elasticsearch::Model.client = Elasticsearch::Client.new host: elasticsearch_url

```


# Setting up with rake

```sh
rake db:migrate
rake db:seed

```

Recreate/Create index and import all data

```sh
   bundle exec rake environment elasticsearch:import:model CLASS='Restaurant' FORCE=y
```

# Setting up with Rails console

## Creating index

Start rails console and execute below command to create index and mapping

```ruby
Restaurant.__elasticsearch__.create_index! force: true
```

## Importing data

After index is created you can seed example data via;

```ruby
   rake db:seed
```

which will insert sample restaurants to database as well as Elasticsearch. 

You can also execute 

```ruby
Restaurant.import
```

at rails console.