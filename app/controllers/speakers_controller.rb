class SpeakersController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show]
	before_action :set_speaker, only: [:show, :edit, :update, :destroy]
	before_action :get_areas, only: [:new, :edit, :index]
	layout 'admin', only: [:new, :edit]

	# GET /speakers
	# GET /speakers.json
	def index
		unless params[:q]
			@speakers = Speaker.order :last_name
		end
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
			@areas = Area.order(:title)
		end

		def save_related_objects
			case params['speaker_images_save_method']
			when 'add', 'replace', 'destroy'
				speaker_images_save_method = params['speaker_images_save_method']
			else
				speaker_images_save_method = 'replace'
			end
			if params['speaker_images'] or speaker_images_save_method == 'destroy'
				if speaker_images_save_method == 'replace' or speaker_images_save_method == 'destroy'
					@speaker.speaker_images.each do |image|
						image.destroy
					end
				end
				if speaker_images_save_method == 'replace' or speaker_images_save_method == 'add'
					params['speaker_images'].each do |image|
						@speaker.speaker_images.create(image: image)
					end
				end
			end

			if params['speaker_videos'] and params['speaker_videos'].first.present?
				video_urls = []
				@speaker.speaker_videos.each do |video|
					video_urls << video.url
					unless params['speaker_videos'].include? video.url
						video.destroy
					end
				end
				params['speaker_videos'].each do |video|
					unless video_urls.include? video
						@speaker.speaker_videos.create(url: video)
					end
				end
			elsif not @speaker.speaker_videos.blank?
				@speaker.speaker_videos.each do |v|
					v.destroy
				end
			end
				
			if params['speaker_areas'] and params['speaker_areas'].first.present?
				sp_area_titles = []
				@speaker.speaker_areas.each do |spa|
					sp_area_titles << spa.area.title
					unless params['speaker_areas'].include? spa.area.title
						spa.destroy
					end
				end
				params['speaker_areas'].each do |param|
					unless sp_area_titles.include? param
						a = Area.new(title: param)
						unless a.save 
							a = Area.find_by(title: param)
						end
						@speaker.speaker_areas.create(area: a)
					end
				end
			elsif not @speaker.speaker_areas.blank?
				@speaker.speaker_areas.each do |a|
					a.destroy
				end
			end
		end
end
