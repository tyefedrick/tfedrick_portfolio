class CreateJoinTableBookReviewsGenres < ActiveRecord::Migration[7.0]
  def change
    create_join_table :book_reviews, :genres do |t|
      # t.index [:book_review_id, :genre_id]
      # t.index [:genre_id, :book_review_id]
    end
  end
end
