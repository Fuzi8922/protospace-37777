class CommentsController < ApplicationController

  def index
  end

  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    if @comment.save
      redirect_to prototype_path(@prototype.id)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(
      user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end