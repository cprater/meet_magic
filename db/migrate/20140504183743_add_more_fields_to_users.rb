class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, default: nil
  	add_column :users, :location, :integer, default: nil
  	add_column :users, :level, :integer, default: nil
  	add_column :users, :score, :integer, default: nil
  	add_column :users, :mentor, :boolean, default: false
  end
end
