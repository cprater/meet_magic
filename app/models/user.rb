class User < ActiveRecord::Base
	serialize :lat_lng, Hash
	serialize :info, Hash
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :populate_lat_lng, :populate_info



  def populate_lat_lng
  	self.lat_lng = {"lat" => find_latitude, "lng" => find_longitude}
  end

  def populate_info
  	self.info = {"name" => self.name, "level" => self.level, "score" => self.score, "mentor" => self.mentor, "lat_lng" => self.lat_lng }
  end

private

	def find_latitude
		results = Geocoder.search(self.location)[0]
		return results.geometry["location"]["lat"] if results
	end

	def find_longitude
		results = Geocoder.search(self.location)[0]
		return results.geometry["location"]["lng"] if results
	end

end
