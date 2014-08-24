class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :rating
      t.string :address
      t.float :lat
      t.float :lon
      t.string :cuisine

      t.timestamps
    end
  end
end
