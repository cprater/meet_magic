class User < ActiveRecord::Base
	serialize :lat_lng, Hash
	serialize :info, Hash
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  geocoded_by :location
  after_validation :geocode, :populate_info

  def populate_info
  	self.info = {"name" => self.name, "email" => self.email, "location" => self.location, "level" => self.level, "score" => self.score, "mentor" => self.mentor, "lat_lng" => {lat: self.latitude, lng: self.longitude} }
  end
  
end
