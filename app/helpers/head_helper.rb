module HeadHelper
	def head_allow_robots?
		['home', 'speakers', 'areas', 'posts', 'contacts'].include? params['controller'] and not admin_signed_in?
	end

	def head_title
		case params['controller']
		when 'speakers'
			if params['action'] != 'index' and @speaker.present? and @speaker.name?
				title = @speaker.full_name
			else
				title = 'Speakers'
			end
		when 'areas'
			if params['action'] != 'index' and @area.present? and @area.title?
				title = @area.title
			else
				title = 'Areas'
			end
		when 'posts'
			if params['action'] != 'index' and @post.present? and @post.title?
				title = @post.title
			else
				title = 'Blog'
			end
		when 'contacts'
			title = 'Contacto'
		when 'admins'
			title = 'Admin'
		end

		if title.present? 
			title + ' | Speakers Bureau'
		else
			'Speakers Bureau'
		end
	end

	def head_description
		case params['controller']
		when 'speakers'
			if params['action'] != 'index' and @speaker.present? and @speaker.description?
				description = @speaker.description
			end
		end

		if description.present?
			description
		else
			'TB & Asociados, Productora de contenidos.'
		end
	end

	def head_og_image
		case params['controller']
		when 'speakers'
			if params['action'] != 'index' and @speaker.present?
				og_image = asset_url @speaker.avatar
			end
		when 'areas'
			og_image = asset_url 'section-areas.jpg'
		when 'posts'
			og_image = asset_url 'section-posts.jpg'
		when 'contacts'
			og_image = asset_url 'section-contacts.jpg'
		end

		if og_image.present?
			og_image
		else
			asset_url 'section-speakers.jpg'
		end
	end

end