class AdminsController < ApplicationController
	before_action :authenticate_admin!
  before_action :set_admin, only: :destroy
	layout 'admin'
  def index
  end

  def list
  	if current_admin.administrator?
  		@admins = Admin.where profile: :regular
  	else
  		redirect_to admin_path, notice: "No tienes permiso para ver esta página."
  	end
  end

  def destroy
  	if current_admin.administrator? and @admin.regular?
  		@admin.destroy
    	redirect_to admin_path, notice: 'Se borró el usuario con exito.'
  	else
  		redirect_to admin_path, notice: "No tienes permiso para esta acción."
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end
end
