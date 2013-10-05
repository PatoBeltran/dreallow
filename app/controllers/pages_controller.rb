class PagesController < ApplicationController
  def landing
    @trending = Dream.all.order('created_at DESC').limit(15)
  end
end
