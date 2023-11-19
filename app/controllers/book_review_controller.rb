class BookReviewController < ApplicationController
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
        @book_review = BookReview.new(title: params[:book_review][:title], body: params[:book_review][:body])
        @book_review.save
    #I need to add a notice. 
       if @book_review.save
        flash[:notice] = "Book Review Created Successfully!"
        redirect_to book_review_url(@book_reivew)
       else 
        render :new
       end
    end

private

  def book_review_params
    params.require(:book_review).permit(:title, :body)
  end

end