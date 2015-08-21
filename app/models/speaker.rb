class Speaker < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
	has_attached_file :avatar, styles: { big: "1600x400#" }
	validates_attachment_content_type :avatar, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	def slug_candidates
		[
			[:name, :last_name],
			[:name, :last_name, :id]
		]
	end
end
