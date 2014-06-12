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
end