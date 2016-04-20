class BulatTeamMembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_bulat_team_member, only: [:show, :edit, :update, :destroy]
  layout 'bulat_team_admin'

  # GET /bulat_team_members
  # GET /bulat_team_members.json
  def index
    @bulat_team_members = BulatTeamMember.all
  end

  # GET /bulat_team_members/1
  # GET /bulat_team_members/1.json
  def show
  end

  # GET /bulat_team_members/new
  def new
    @bulat_team_member = BulatTeamMember.new
  end

  # GET /bulat_team_members/1/edit
  def edit
  end

  # POST /bulat_team_members
  # POST /bulat_team_members.json
  def create
    @bulat_team_member = BulatTeamMember.new(bulat_team_member_params)

    respond_to do |format|
      if @bulat_team_member.save
        format.html { redirect_to @bulat_team_member, notice: 'Bulat team member was successfully created.' }
        format.json { render :show, status: :created, location: @bulat_team_member }
      else
        format.html { render :new }
        format.json { render json: @bulat_team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulat_team_members/1
  # PATCH/PUT /bulat_team_members/1.json
  def update
    respond_to do |format|
      if @bulat_team_member.update(bulat_team_member_params)
        format.html { redirect_to @bulat_team_member, notice: 'Bulat team member was successfully updated.' }
        format.json { render :show, status: :ok, location: @bulat_team_member }
      else
        format.html { render :edit }
        format.json { render json: @bulat_team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulat_team_members/1
  # DELETE /bulat_team_members/1.json
  def destroy
    @bulat_team_member.destroy
    respond_to do |format|
      format.html { redirect_to bulat_team_members_url, notice: 'Bulat team member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulat_team_member
      @bulat_team_member = BulatTeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bulat_team_member_params
      params.require(:bulat_team_member).permit(:title, :link, :color, :image)
    end
end
