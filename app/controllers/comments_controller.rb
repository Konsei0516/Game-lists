class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    @comment = review.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id]) 
    if @comment.destroy
      render :index 
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
