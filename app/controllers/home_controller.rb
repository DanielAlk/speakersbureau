class HomeController < ApplicationController
  def index
  	@speakers = Speaker.order :last_name
  	@carouselSpeakers = Speaker.where(visible_on_home: true).order :position
  	@last_post = Post.last
  	@areas = Area.order :title
  end
end
