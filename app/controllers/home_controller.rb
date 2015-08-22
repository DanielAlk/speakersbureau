class HomeController < ApplicationController
  def index
  	@speakers = Speaker.all
  	@speakers_for_carousel = @speakers.where(:visible_on_home => true)
  	@last_post = Post.last
  	@areas = Area.all
  end
end
