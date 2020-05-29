class AddNumcountToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :likes_count, :integer
  end
end
