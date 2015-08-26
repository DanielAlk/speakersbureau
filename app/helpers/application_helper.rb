module ApplicationHelper
	def nav_class(name)
		'active' if params['controller'] == name
	end

	def dropdown(btn_class = '', text = '', placeholder = '', collection)
		items = capture do
			collection.each do |item|
				yield item
			end
		end
		"<div class='ui floating dropdown button icon btn dropdown-toggle #{btn_class}'>
			<span class='caret'></span>
			<span class='text'>#{text}</span>
			<div class='menu'>
				<div class='ui icon search input'>
					<i class='glyphicon glyphicon-search'></i>
					<input type='text' class='form-control' placeholder='#{placeholder}'>
				</div>
				<div class='scrolling menu'>
					#{items}
				</div>
			</div>
		</div>".html_safe
	end
end
