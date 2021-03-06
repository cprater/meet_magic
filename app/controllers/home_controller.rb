class HomeController < ApplicationController
	respond_to :json

	def index

		if current_user
			location = [current_user.latitude, current_user.longitude]
		else
			location = [request.location.latitude, request.location.longitude]
		end

		@nearby_users_count = User.near(location).count
		@all_users_count = User.all.count
	end

	def get_started
	end
end