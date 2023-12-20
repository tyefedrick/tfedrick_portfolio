class AddFieldsToBookReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :book_reviews, :release_date, :date
    add_column :book_reviews, :page_count, :integer
    add_column :book_reviews, :review_posted_date, :date
    add_column :book_reviews, :isbn, :string
    add_column :book_reviews, :publisher, :string
    add_column :book_reviews, :link, :string
  end
end
