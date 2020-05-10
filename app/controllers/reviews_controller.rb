class ReviewsController < ApplicationController
  def index
  end

  def rakuten_search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],hits: 10)
    end
  end
end
