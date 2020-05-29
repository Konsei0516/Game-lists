class Review < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :post_category_relations, dependent: :destroy
  has_many :categories, through: :post_category_relations
  has_many :likes, dependent: :destroy
  has_many :comments

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :rate, presence: true
end
