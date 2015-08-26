module AreasHelper
	def selected_areas(areas)
		selected = []
		areas.each do |area|
			selected << area.title
		end
		selected.to_s.html_safe
	end
end
