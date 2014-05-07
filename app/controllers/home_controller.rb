class Rack::Request
	def ip
		'184.154.83.119'
	end
end


class HomeController < ApplicationController
	def index
		@user = User.new
	end

	def map
		@latitude = request.location.latitude
		@longitude = request.location.longitude
	end
end