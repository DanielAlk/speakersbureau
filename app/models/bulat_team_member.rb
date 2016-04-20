class BulatTeamMember < ActiveRecord::Base
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
end
