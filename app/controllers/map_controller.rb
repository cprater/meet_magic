class MapController < ApplicationController

	def show
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
		points = Info.where('level = ? or mentor = true', current_user.level)
		render json: {points: points}
	end

end