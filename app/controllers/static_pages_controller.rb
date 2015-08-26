class StaticPagesController < ApplicationController
	layout 'clean', only: :brand
  def brand
  end
end
