class HomeController < ApplicationController
	before_action :render_bulat_team

  def index
  	@speakers = Speaker.order :last_name
  	@carouselSpeakers = Speaker.where(visible_on_home: true).order :position
  	@last_post = Post.last
  	@areas = Area.order :title
  end

  def bulat_team
  end

  private

  	def render_bulat_team
  		if @is_domain_bulat
	  		@bulat_team_members = BulatTeamMember.all
	  		render action: :bulat_team, layout: 'bulat_team'
	  	end
  	end

end
