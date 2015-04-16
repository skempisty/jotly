class RepliesController < ApplicationController

  def new
    @reply = Reply.new
    @comment = Comment.find(params[:comment_id])
  end

  def create
    Reply.create(reply_params)
    comment = Comment.find(params[:comment_id])
    redirect_to jot_comments_path(comment.jot.id)
  end

  def edit
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
  end

  def update
    reply = Reply.find(params[:id])
    reply.update(reply_params)
    redirect_to jot_comments_path(reply.comment.jot.id)
  end

  def destroy
    reply = Reply.find(params[:id])
    reply.destroy
    redirect_to :back
  end

  private
  def reply_params
    params.require(:reply).permit(
      :content).merge(
      comment_id: params[:comment_id],user_id: session[:current_user])
  end
end
