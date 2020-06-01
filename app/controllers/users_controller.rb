class UsersController < ApplicationController
  def show
    @user = User.find_by(id:params[:id])
    @reviews = @user.reviews.order('created_at DESC').page(params[:page]).per(6)
  end

  def like
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).page(params[:page]).per(6)
  end
end
