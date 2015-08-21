class SpeakerImage < ActiveRecord::Base
  belongs_to :speaker
  has_attached_file :image, styles: { thumbnail: "85x75#", standard: "375x240#"  }
	validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
end
