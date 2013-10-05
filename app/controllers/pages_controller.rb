class PagesController < ApplicationController
  def landing
    @dream
  end

  def random
    @dream = Dream.find(:first, order: "RAND()")
    redirect_to dream_path
  end
end
