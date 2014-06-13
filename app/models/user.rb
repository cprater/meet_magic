class User < ActiveRecord::Base
	serialize :lat_lng, Hash
	serialize :info, Hash
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  geocoded_by :location
  after_validation :geocode
  before_save :populate_lat_lng, :populate_info

  def populate_lat_lng
  	self.lat_lng = find_lat_lng
  end

  def populate_info
  	self.info = {"name" => self.name, "email" => self.email, "location" => self.location, "level" => self.level, "score" => self.score, "mentor" => self.mentor, "lat_lng" => self.lat_lng }
  end

private

  def find_lat_lng
    results = Geocoder.search(self.location)[0]
    return results.geometry["location"] if results
  end
  
end
