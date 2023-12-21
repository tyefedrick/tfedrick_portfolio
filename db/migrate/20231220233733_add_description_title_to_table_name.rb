class AddDescriptionTitleToTableName < ActiveRecord::Migration[7.0]
  def change
    add_column :book_reviews, :description_title, :string
  end
end
