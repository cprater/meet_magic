class SearchController < ApplicationController
	def search
		@input = params[:search][:input].capitalize
		
		@users = User.find(:all, conditions: ['location LIKE ? OR name LIKE ?', "%#{@input}%", "%#{@input}%"])

	end
end