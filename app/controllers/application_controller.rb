class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :ransack_search_object

  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
    render template: 'static_pages/404.html.erb', status: 404, content_type: 'text/html'
  end

  private

		def set_locale
		  I18n.locale = 'es'
		end

		def ransack_search_object
			search = params[:search][:q].split(/\s/) rescue params[:search]
			@speakers_search = Speaker.ransack(name_or_last_name_or_description_or_information_or_areas_title_cont_any: search)
			if params[:search].present? and params[:search][:q].present?
        speakers_result = @speakers_search.result(distinct: true)
        speakers_result.each do |speaker|
          if speaker.full_name.downcase == params[:search][:q].downcase
            @speakers_result = [ speaker ]
            break
          end
        end
        @speakers_result = speakers_result if @speakers_result.blank?
      end
		end
end
