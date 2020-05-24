class PostCategoryRelation < ApplicationRecord
  belongs_to :review
  belongs_to :category
end
