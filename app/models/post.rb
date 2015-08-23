class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def video_url
  	sv = self.video
  	sv['watch?v=']= 'embed/'
  	sv
  end

  def date
  	d = self.updated_at
  	d.day.to_s + '/' + d.month.to_s
  end

  def short_body
    body = self.body[0, 500]
    body[0 , body.rindex(/\s/)]
  end

  def shorter_body
  	body = self.body[0, 300]
    body[0 , body.rindex(/\s/)]
  end

  private
		def slug_candidates
			[
				:title
			]
		end
end
