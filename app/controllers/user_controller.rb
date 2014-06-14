class UserController < ApplicationController
	
	def users_near_me
		if current_user
			@nearby_users = current_user.nearbys(10).sort_by{|u| -u.level}
		else
			@nearby_users = User.near([request.location.latitude, request.location.longitude]).sort_by{|u| -u.level}
		end
	end

	def all_users
		@users = User.all
		@users.sort_by!{|u| u.location}
	end

	def users_by_location
		@location = params[:user]["location"]
		@users = User.near(@location, 10)
	end

end