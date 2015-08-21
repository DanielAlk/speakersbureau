class SpeakerArea < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :area
end
