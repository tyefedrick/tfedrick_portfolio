class CreateBookReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :book_reviews do |t|
      t.string :title
      t.string :genre
      t.integer :rating
      t.text :body
      t.text :notes

      t.timestamps
    end
  end
end
