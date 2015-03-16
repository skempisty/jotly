class LikesController < ApplicationController

  def like
    Like.create(user_id: current_user.id, jot_id: params[:id])
    redirect_to :back
  end

  def unlike
    @like = Like.where(user_id: current_user.id, jot_id: params[:id])
    @like.delete_all
    Jot.decrement_counter(:likes_count, params[:id])
    redirect_to :back
  end

  def show
    @likes = Like.where(jot_id: params[:id])
  end

end
