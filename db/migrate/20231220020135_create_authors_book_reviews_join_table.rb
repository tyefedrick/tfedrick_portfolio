# rails generate migration CreateAuthorsBookReviewsJoinTable
# That command created this. Once you add your content, be sure to add rails db:migrate.


class CreateAuthorsBookReviewsJoinTable < ActiveRecord::Migration[7.0]
    def change
      create_table :authors_book_reviews, id: false do |t|
        t.references :author, foreign_key: true
        t.references :book_review, foreign_key: true
    end
  end
end