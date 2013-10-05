class DreamsController < ApplicationController

  def index
    @dreams = Dream.all
  end

  def new
    @dream = current_user.dreams.build
  end

  def show
    @dream = Dream.find(params[:id])
    @meanings = @dream.meanings
  end

  def create
    if current_user
      @dream = current_user.dreams.build(dream_params)
    else
      @dream = Dream.new(dream_params)
    end
    if @dream.save
      if current_user.present?
        redirect_to dreams_path, flash: { notice: "Dream successfully created" }
      else
        redirect_to root_path
      end
    else
      render "new"
    end
  end

  def destroy
    Dream.find(params[:id]).destroy
    redirect_to dreams_path, flash: { notice: "Dream successfully deleted" }
  end

  def upvote
    @dream = Dream.find(params[:id])
    @dream.liked_by current_user
    redirect_to dream_path(@dream)
  end

  def random
    @dream = Dream.first(:order => "RANDOM()")
    redirect_to dream_path(@dream)
  end

  private
  def dream_params
    params.require(:dream).permit(:content, :shared)
  end
end
