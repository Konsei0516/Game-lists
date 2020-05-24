class Review < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :post_category_relations, dependent: :destroy
  has_many :categories, through: :post_category_relations

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :rate, presence: true
end
