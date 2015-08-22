class Area < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :speaker_areas, :dependent => :destroy
	has_many :speakers, through: :speaker_areas

	private
		def slug_candidates
			[
				:title
			]
		end
end
