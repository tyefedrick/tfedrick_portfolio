#rails generate model BookReview title:string rating:integer body:text notes:text
class BookReview < ApplicationRecord
    has_rich_text:body

    validates :body, presence: true
end
