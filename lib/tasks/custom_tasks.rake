require File.join(File.dirname(__FILE__), "..", "..", "config", "environment")

namespace :user do

	desc "Populate latitude and longitude fields"
	task :geocode do 
		User.all.each do |user|
			unless user.latitude
				user.geocode
				user.save
			end
		end
	end


end