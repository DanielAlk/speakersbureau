class Area < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :speaker_areas
	has_many :speakers, through: :speaker_areas

	def slug_candidates
		[
			[:title],
			[:title, :id]
		]
	end
end
