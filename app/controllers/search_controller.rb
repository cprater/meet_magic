class SearchController < ApplicationController
	def search
		@input = capitalize_helper(params[:search][:input])
		@users = User.find(:all, conditions: ['location LIKE ? OR name LIKE ?', "%#{@input}%", "%#{@input}%"])
		@users.sort_by!{|u| -u.level}
	end

	

end