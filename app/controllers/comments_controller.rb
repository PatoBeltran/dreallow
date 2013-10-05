class CommentsController < ApplicationController

  before_filter :find_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comments_params)
    if @comment.save
      redirect_to @commentable_father.blank? ? @commentable : @commentable_father, notice: "Comment created."
    else
      render :new
    end
  end

  private

  def find_commentable

    path_size = request.path.split('/').size

    if path_size <= 5
      resource, id = request.path.split('/')[1, 2]
    else
      resource, id = request.path.split('/')[3,4]
      resource_f, id_f = request.path.split('/')[1, 2]
      @commentable_father = resource_f.singularize.classify.constantize.find(id_f)
    end
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comments_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

end
