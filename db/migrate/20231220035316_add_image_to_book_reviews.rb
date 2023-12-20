class AddImageToBookReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :book_reviews, :image, :attachment
  end
end
