class Rack::Request
	def ip
		'184.154.83.119'
	end
end


class HomeController < ApplicationController
	respond_to :json

	def index
		@user = User.new

		# @nearby_users_count = User.where(lat_lng: {"lat"=>43.1139161, "lng"=> -84.08830429999999}).count
		@all_users_count = User.all.count
	end

	def map
		unless current_user
			redirect_to new_user_session_path
		end
	end

	def get_current_user_coords
		render json: {coords: {lat: request.location.latitude, 
													lng: request.location.longitude}}
	end

	def get_all_user_coords
		points = User.where('level = ? or mentor = true', current_user.level).pluck(:info)
		render json: {points: points}
	end

end