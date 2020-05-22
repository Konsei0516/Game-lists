class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text   :description
      t.float  :rate
      
      t.timestamps
    end
  end
end
