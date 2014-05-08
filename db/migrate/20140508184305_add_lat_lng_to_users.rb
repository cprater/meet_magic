class AddLatLngToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :lat_lng, :text
  end
end
