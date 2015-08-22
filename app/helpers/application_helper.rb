module ApplicationHelper
	def nav_class(name)
		'active' if params['controller'] == name
	end
end
