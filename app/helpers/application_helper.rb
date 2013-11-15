module ApplicationHelper

	def full_page_title(this_page_title)

		base_title = "Our Wedding"
		
		if this_page_title.empty?
			base_title
		else
			"#{base_title} | #{this_page_title}"
		end
	end
end
