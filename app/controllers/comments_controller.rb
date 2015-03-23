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
end