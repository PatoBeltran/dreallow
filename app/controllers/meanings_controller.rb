class MeaningsController < ApplicationController
  before_filter :load_commentable
  before_filter :authenticate_user!

  def new
    @meaning = current_user.meanings.build
  end

  def create
    @meaning = current_user.meanings.create(content: params[:meaning][:content], dream_id: params[:dream_id])
    if ( @meaning.save )
      respond_to do |format|
        format.html {  redirect_to @commentable, notice: "Meaning created." }
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    Meaning.find(params[:id]).destroy
    redirect_to @commentable, flash: { notice: "Meaning successfully deleted" }
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
