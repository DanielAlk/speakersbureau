class HomeController < ApplicationController
  def index
  	@speakers = Speaker.order :last_name
  	@last_post = Post.last
  	@areas = Area.order :title
  end
end
