module SpeakersHelper
	def speaker_images(style = nil)
		images = []
		@speaker.images(style).each_with_index do |image|
			images.push(image_tag image)
		end
		unless images.present?
			images.push(image_tag "speaker-image-default-#{style}.jpg")
		end
		images.join.html_safe
	end
end
