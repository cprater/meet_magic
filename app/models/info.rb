class Info <ActiveRecord::Base
	belongs_to :user
	serialize :lat_lng, Hash

end