class User < ActiveRecord::Base
  has_many :infos
	serialize :lat_lng, Hash
	# serialize :info, Hash
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  geocoded_by :location
  after_validation :geocode
  after_save :populate_info

  def populate_info
    info = Info.new("name" => self.name, "email" => self.email, "location" => self.location, "level" => self.level, "score" => self.score, "mentor" => self.mentor, "lat_lng" => {lat: self.latitude, lng: self.longitude})
  	self.infos << info
  end
  
end
