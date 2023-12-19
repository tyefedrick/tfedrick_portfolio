#try this - rails generate scaffold

  class BookReviewsController < ApplicationController
        def index 
          @genres = Genre.all
          @selected_genres = params[:genre_ids] || []
          
          if @selected_genres.empty?
            @book_reviews = BookReview.all
          else
            @book_reviews = BookReview.includes(:genres).where(genres: { id: @selected_genres }).distinct
          end
          
          @all_reviews = BookReview.all  # Fetch all book reviews
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
        params.require(:book_review).permit(:title, :rating, :body, :notes, genre_ids: [])
      end

    end

