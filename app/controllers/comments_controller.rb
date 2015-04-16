class CommentsController < ApplicationController
  def new
    @jot=Jot.find(params[:jot_id])
    @comment= Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to jot_comments_path
  end

  def index
    @comments = Comment.where(jot_id: params[:jot_id])
    @jot=Jot.find(params[:jot_id])
  end

  def edit
    @jot = Jot.find(params[:jot_id])
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to jot_comments_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(
      :content).merge(
      user_id: current_user.id,jot_id: params[:jot_id])
  end
end
