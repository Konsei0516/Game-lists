class LikesController < ApplicationController
  before_action :set_review

  def create
    @like = Like.create(user_id: current_user.id, review_id: params[:review_id])
    @likes = Like.where(review_id: params[:review_id])
    @review.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, review_id: params[:review_id])
    like.destroy
    @likes = Like.where(review_id: params[:review_id])
    @review.reload
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end
