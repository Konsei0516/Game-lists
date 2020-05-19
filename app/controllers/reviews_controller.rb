class ReviewsController < ApplicationController
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
  end

  def destroy
  end

  def rakuten_search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],hits: 10)
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :descreption, images_attributes: [:src])
  end
end
