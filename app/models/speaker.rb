class Speaker < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
	has_attached_file :avatar, styles: { big: "1600x400#" }
	validates_attachment_content_type :avatar, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	has_many :speaker_areas
	has_many :areas, through: :speaker_areas

	has_many :speaker_images
	has_many :speaker_videos

	def videos
		self.speaker_videos
	end

	def images
		self.speaker_images
	end

	def full_name
		self.name + ' ' + self.last_name
	end

	def slug_candidates
		[
			[:name, :last_name]
		]
	end
end
