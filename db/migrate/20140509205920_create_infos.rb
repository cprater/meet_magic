class CreateInfos < ActiveRecord::Migration
  def change
  	create_table :infos do |t|
  		t.belongs_to :user
  		t.string :name
  		t.string :email
  		t.string :location
  		t.integer :level
  		t.integer :score
  		t.boolean :mentor
  		t.text :lat_lng
  	end
  end
end
