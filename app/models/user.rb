class User < ActiveRecord::Base
	serialize :lat_lng, Hash
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :populate_lat_lng


  def populate_lat_lng
  	self.lat_lng = {["lat"] => find_latitude, ["lng"] => find_longitude}
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
