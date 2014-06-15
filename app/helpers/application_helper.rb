module ApplicationHelper
	def capitalize_helper query
		query.split.map! do |word|
			word.capitalize
		end
		.join(" ")
	end
end
