class CommentsController < ApplicationController
  def new
    @jot=Jot.find(params[:jot_id])
    @comment= Comment.new
  end

  def create
    Comment.create(params.require(:comment).permit(:content).merge(user_id: current_user.id,jot_id: params[:jot_id]))
    redirect_to jot_comments_path
  end

  def index
    @comments = Comment.where(jot_id: params[:jot_id])
    @jot=Jot.find(params[:jot_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to :back
  end

end
