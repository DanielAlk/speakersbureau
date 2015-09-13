class Speaker < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
	has_attached_file :avatar, styles: { big: "1600x663#" }, default_url: "speaker-avatar-default.jpg"
	validates_attachment_content_type :avatar, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	has_many :speaker_areas, :dependent => :destroy
	has_many :speaker_images, :dependent => :destroy
	has_many :speaker_videos, :dependent => :destroy
	has_many :areas, through: :speaker_areas

	ransacker :q

	def full_name
		self.name + ' ' + self.last_name
	end

	def profile_image(style = nil)
		img = self.speaker_images.first
		return img.present? ? img.image(style) : "speaker-image-default-#{style}.jpg"
	end

	def videos_url
		videos_url = []
		self.speaker_videos.each do |sv|
			videos_url << sv.url
		end
		return videos_url
	end

	def area_titles
		area_titles = []
		self.areas.each do |a|
			area_titles << a.title
		end
		area_titles
	end

	private
		def slug_candidates
			[
				[:name, :last_name]
			]
		end
end
