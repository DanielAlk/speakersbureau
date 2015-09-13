class SpeakerImagesController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_speaker_image

	# DELETE /speaker_images/1
	# DELETE /speaker_images/1.json
	def destroy
		@speaker_image.destroy
		respond_to do |format|
			format.html { redirect_to speakers_url, notice: 'Speaker image was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_speaker_image
			@speaker_image = SpeakerImage.find(params[:id])
		end

end