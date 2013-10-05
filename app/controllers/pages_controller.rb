class PagesController < ApplicationController
  def landing
    unless current_user.present?
      @trending = Dream.all.order('created_at DESC').limit(8)
    else
      redirect_to dreams_path
    end
  end
end
