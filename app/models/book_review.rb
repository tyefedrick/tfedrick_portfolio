#rails generate model BookReview title:string rating:integer body:text notes:text
class BookReview < ApplicationRecord
    has_rich_text:body
    has_and_belongs_to_many :authors
    has_and_belongs_to_many :genres
    has_one_attached :image
    validates :body, presence: true
    validates :release_date, presence: true
    validates :page_count, presence: true
    validates :review_posted_date, presence: true
    validates :isbn, presence: true
    validates :publisher, presence: true
    validates :link, presence: true
end
