class Rack::Request
	def ip
		'184.154.83.119'
	end
end


class HomeController < ApplicationController
	respond_to :json

	def index
		@user = User.new

		if current_user
			location = [current_user.latitude, current_user.longitude]
		else
			location = [request.location.latitude, request.location.longitude]
		end

		@nearby_users_count = User.near(location, 10).count
		@all_users_count = User.all.count
	end

	def map
		unless current_user
			redirect_to new_user_session_path
		end
	end

	def get_current_user_coords
		if current_user
			lat, lng = current_user.latitude, current_user.longitude
		else
			lat, lng = request.location.latitude, request.location.longitude
		end
			render json: {coords: {lat: lat, lng: lng}}
	end

	def get_all_user_coords
		points = User.where('level = ? or mentor = true', current_user.level).pluck(:info)
		render json: {points: points}
	end

	def users_near_me
		if current_user
			@nearby_users = current_user.nearbys(10)
		else
			@nearby_users = User.near([request.location.latitude, request.location.longitude], 10)
		end
	end

	def all_users
		@users = User.all
	end

	def users_by_location
		@location = params[:user]["location"]
		@users = User.near(@location, 10)
	end

end