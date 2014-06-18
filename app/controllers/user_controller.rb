class UserController < ApplicationController
	respond_to :json


	def users_near_me
		if current_user
			@nearby_users = current_user.nearbys(10).sort_by{|u| -u.level}
		else
			@nearby_users = User.near([request.location.latitude, request.location.longitude]).sort_by{|u| -u.level}
		end

		render layout: false
	end

	def all_users
		@users = User.all
		@users.sort_by!{|u| u.location}

		render layout: false
	end

	def show
		unless current_user
		 redirect_to new_user_session_path
		end
		@user = User.find(params[:format])
	end

	def find_user
		binding.pry
	end

end