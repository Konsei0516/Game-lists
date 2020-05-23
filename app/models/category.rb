class Category < ApplicationRecord
  validates :name, presence: true
  has_many :post_category_relations, dependent: :destroy
  has_many :reviews, through: :post_category_relations
end
