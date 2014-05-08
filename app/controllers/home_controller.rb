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
	end

	def get_current_user_coords
		render json: {coords: {lat: request.location.latitude,
													lon: request.location.longitude}}
	end

	def get_all_user_coords
		# points = []
		# User.all.each do |u|
			
		# end

		# render json: {points: points}
	end

end