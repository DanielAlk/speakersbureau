class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :ransack_search_object

  private

		def set_locale
		  I18n.locale = 'es'
		end

		def ransack_search_object
			search = params[:q].present? ? params[:q][:search].split(/\s/) : params[:q]
			@q = Speaker.ransack(name_or_last_name_or_description_or_information_or_areas_title_cont_any: search)
			@speakers = @q.result(distinct: true)
		end
end
