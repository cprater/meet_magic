class Rack::Request
	def ip
		'184.154.83.119'
	end
end


class HomeController < ApplicationController
	respond_to :json

	def index
		@user = User.new
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
		points = User.where(level: current_user.level).pluck(:lat_lng)

		render json: {points: points}
	end

end