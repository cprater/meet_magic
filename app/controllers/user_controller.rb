class UserController < ApplicationController
	
	def users_near_me
		if current_user
			@nearby_users = current_user.nearbys(10).sort_by{|u| -u.level}
		else
			@nearby_users = User.near([request.location.latitude, request.location.longitude]).sort_by{|u| -u.level}
		end
		@near = true
	end

	def all_users
		@users = User.all
		@all = true
		@users.sort_by!{|u| u.location}
	end

	def show
		unless current_user
		 redirect_to new_user_session_path
		end
		@user = User.find(params[:format])
	end

end