class SearchController < ApplicationController
	respond_to :json

	def search
		if request.xhr?
			@input = capitalize_helper(params[:query])
		else
			@input = capitalize_helper(params[:search][:input])
		end

		@users = User.find(:all, conditions: ['location LIKE ? OR name LIKE ?', "%#{@input}%", "%#{@input}%"])
		@users.sort_by!{|u| -u.level}

		render layout: false
	end

	def list_view
		location = [current_user.latitude, current_user.longitude]
		@nearby_users_count = User.near(location).count
		@all_users_count = User.all.count
	end	

end