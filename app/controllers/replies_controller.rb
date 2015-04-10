class RepliesController < ApplicationController

  def new
    @reply = Reply.new
    @comment = Comment.find(params[:comment_id])
    @jot = Jot.find(params[:jot_id])
  end

  def create
    Reply.create(params.require(:reply).permit(:content).merge(comment_id: params[:comment_id],user_id: session[:current_user]))
    redirect_to jot_comments_path(params[:jot_id],params[:comment_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
