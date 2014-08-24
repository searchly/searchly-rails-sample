# Searchly Sample Rails Application

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