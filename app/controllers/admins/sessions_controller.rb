class Admins::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  layout :choose_layout

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  private
    
    def choose_layout
      if @is_domain_bulat
        'bulat_team'
      else
        'admin'
      end
    end
    
end
