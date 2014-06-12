# class Rack::Request
# 	def ip
# 		'184.154.83.119'
# 		# '167.202.201.21'
# 	end
# end


class HomeController < ApplicationController
	respond_to :json

	def index

		if current_user
			location = [current_user.latitude, current_user.longitude]
		else
			location = [request.location.latitude, request.location.longitude]
		end

		@nearby_users_count = User.near(location, 10).count
		@all_users_count = User.all.count
	end


	def users_near_me
		if current_user
			@nearby_users = current_user.nearbys(10).sort_by{|u| -u.level}
		else
			@nearby_users = User.near([request.location.latitude, request.location.longitude], 10).sort_by{|u| -u.level}
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