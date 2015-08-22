class HomeController < ApplicationController
  def index
  	@speakers = Speaker.all
  	@last_post = Post.last
  	@areas = Area.all
  end
end
