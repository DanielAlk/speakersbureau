class SpeakersController < ApplicationController
	before_action :set_speaker, only: [:show, :edit, :update, :destroy]
	before_action :get_areas, only: [:new, :edit, :index]

	# GET /speakers
	# GET /speakers.json
	def index
		@speakers = Speaker.order :last_name
	end

	# GET /speakers/1
	# GET /speakers/1.json
	def show
	end

	# GET /speakers/new
	def new
		@speaker = Speaker.new
	end

	# GET /speakers/1/edit
	def edit
	end

	# POST /speakers
	# POST /speakers.json
	def create
		@speaker = Speaker.new(speaker_params)

		respond_to do |format|
			if @speaker.save
				save_related_objects
				format.html { redirect_to @speaker, notice: 'Speaker was successfully created.' }
				format.json { render :show, status: :created, location: @speaker }
			else
				format.html { render :new }
				format.json { render json: @speaker.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /speakers/1
	# PATCH/PUT /speakers/1.json
	def update
		respond_to do |format|
			if @speaker.update(speaker_params)
				save_related_objects
				format.html { redirect_to @speaker, notice: 'Speaker was successfully updated.' }
				format.json { render :show, status: :ok, location: @speaker }
			else
				format.html { render :edit }
				format.json { render json: @speaker.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /speakers/1
	# DELETE /speakers/1.json
	def destroy
		@speaker.destroy
		respond_to do |format|
			format.html { redirect_to speakers_url, notice: 'Speaker was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_speaker
			@speaker = Speaker.friendly.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def speaker_params
			params.require(:speaker).permit(:name, :last_name, :email, :description, :information, :twitter, :avatar, :visible_on_home)
		end

		def get_areas
			@areas = Area.order :title
		end

		def save_related_objects
			if params['speaker_images']
				@speaker.speaker_images.each do |image|
					image.destroy
				end
				params['speaker_images'].each do |image|
					@speaker.speaker_images.create(image: image)
				end
			end
			if params['speaker_areas'] and params['speaker_areas'].first.present?
				@speaker.speaker_areas.each do |area|
					area.destroy
				end
				params['speaker_areas'].each do |speaker_area|
					if speaker_area.present?
						area = Area.find_by(:title => speaker_area) || Area.create(:title => speaker_area)
						@speaker.speaker_areas.create(area: area)
					end
				end
			end
		end
end
