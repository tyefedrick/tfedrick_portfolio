#try this - rails generate scaffold
class BookReviewsController < ApplicationController
    def index 
        @book_review = BookReview.all
    end

    def show  
        @book_review = BookReview.find(params[:id])
            rescue ActiveRecord::RecordNotFound
        redirect_to book_review_path
    end

    def new 
        @book_review = BookReview.new
    end

    def create
        @book_review = BookReview.new(book_review_params)
      
        if @book_review.save
          flash[:notice] = "Book Review Created Successfully!"
          redirect_to book_review_path(@book_review)
        else
          render :new
        end
      end

      def edit
        @book_review = BookReview.find(params[:id])
      end
    
      def update
        @book_review = BookReview.find(params[:id])
    
        if @book_review.update(book_review_params)
          flash[:notice] = "Book Review Updated Successfully!"
          redirect_to book_review_path(@book_review)
        else
          render :edit
        end
      end
    
      def destroy
        @book_review = BookReview.find(params[:id])
        @book_review.destroy
        flash[:notice] = "Book Review Deleted Successfully!"
        redirect_to book_reviews_path
      end

private

  def book_review_params
    params.require(:book_review).permit(:title, :genre, :rating, :body, :notes)
  end

end