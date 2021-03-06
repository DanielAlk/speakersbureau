class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def video_url
  	sv = self.video
    if sv['watch?v=']
    	sv['watch?v=']= 'embed/'
    	sv
    end
  end

  def date_short
  	d = self.created_at
  	d.day.to_s + '/' + d.month.to_s
  end

  def date_complete
    self.date_short+'/'+self.created_at.year.to_s
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
