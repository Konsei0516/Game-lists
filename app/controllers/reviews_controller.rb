class ReviewsController < ApplicationController
  before_action :set_review, except: [:index,:new, :create,:rakuten_search,:search]
  before_action :set_category, only: %i[index new create edit update search]

  def index
    @reviews = Review.includes(:images).order('created_at DESC').page(params[:page]).per(8)
    @q = Review.ransack(params[:q])
  end

  def new
    @review = Review.new
    @review.images.new
  end

  def show
    @comments = @review.comments
    @comment = @review.comments.build
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(update_review_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  def search
    @q = Review.search(search_params)
    @reviews = @q.result(distinct: true).page(params[:page]).per(9)
  end

  def rakuten_search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],hits: 10)
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rate, category_ids: [], images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def update_review_params
    params.require(:review).permit(
    :title,:description, :rate, category_ids: [],
    images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_category
    @categories = Category.all
  end

  def search_params
    params.require(:q).permit!
  end
end
