class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  private
		def slug_candidates
			[
				:title
			]
		end
end
