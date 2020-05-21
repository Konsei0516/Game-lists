class ReviewsController < ApplicationController
  before_action :set_review, except: [:index, :new, :create,:rakuten_search]

  def index
    @reviews = Review.includes(:images).order('created_at DESC')
  end

  def new
    @review = Review.new
    @review.images.new
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
    if @review.update(review_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  def rakuten_search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],hits: 10)
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :descreption, :rate,images_attributes: [:src])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
