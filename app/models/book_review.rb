#rails generate model BookReview title:string rating:integer body:text notes:text
class BookReview < ApplicationRecord
    has_rich_text:body
    has_and_belongs_to_many :authors
    has_and_belongs_to_many :genres
    validates :body, presence: true
end
