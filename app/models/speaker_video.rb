class SpeakerVideo < ActiveRecord::Base
  belongs_to :speaker

  def embed_url
  	url = self.url
  	url['watch?v=']= 'embed/' if url['watch?v=']
  	url
  end

end
