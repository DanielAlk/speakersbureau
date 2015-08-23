class Speaker < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
	has_attached_file :avatar, styles: { big: "1600x663#" }, default_url: "speaker-avatar-default.jpg"
	validates_attachment_content_type :avatar, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	has_many :speaker_areas, :dependent => :destroy
	has_many :speaker_images, :dependent => :destroy
	has_many :speaker_videos, :dependent => :destroy
	has_many :areas, through: :speaker_areas

	def full_name
		self.name + ' ' + self.last_name
	end

	def images(style = nil)
		images = []
		self.speaker_images.each do |si|
			images << si.image(style)
		end
		images << "speaker-image-default-#{style}.jpg" unless images.present?
		return images
	end

	def profile_image(style = nil)
		img = self.speaker_images.first
		return img.present? ? img.image(style) : "speaker-image-default-#{style}.jpg"
	end

	def videos
		videos = []
		self.speaker_videos.each do |sv|
			url = sv.url
			url['watch?v=']= 'embed/'
			videos << { :url => url, :title => sv.title }
		end
		return videos
	end

	def area_list
		last_index = self.areas.count-1
		output = ''
		self.areas.each_with_index do |a, i|
			output << a.title + (i != last_index ? ', ' : '.')
		end
		output
	end

	private
		def slug_candidates
			[
				[:name, :last_name]
			]
		end
end
