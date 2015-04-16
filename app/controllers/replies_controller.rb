class RepliesController < ApplicationController

  def new
    @reply = Reply.new
    @comment = Comment.find(params[:comment_id])
  end

  def create
    Reply.create(params.require(:reply).permit(:content).merge(comment_id: params[:comment_id],user_id: session[:current_user]))
    comment = Comment.find(params[:comment_id])
    redirect_to jot_comments_path(comment.jot.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
