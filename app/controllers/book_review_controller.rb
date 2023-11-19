class BookReviewController < ApplicationController
    def index 
        @book_review = BookReview.all
    end

def show  
    @book_review = BookReview.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to book_review_path
  end
end