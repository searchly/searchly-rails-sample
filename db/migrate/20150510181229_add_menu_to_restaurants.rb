class AddMenuToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :menu, :text, array: true
  end
end
