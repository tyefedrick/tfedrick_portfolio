#try this - rails generate scaffold

  class BookReviewsController < ApplicationController
        def index
          @search_query = params[:title]
          @authors = Author.all
          @genres = Genre.all
          @selected_genres = params[:genre_ids] || []
      
          @book_reviews = BookReview.all
      
          if @selected_genres.present?
            selected_genre_ids = Genre.where(id: @selected_genres).pluck(:id)
            @book_reviews = @book_reviews.joins(:genres).where(genres: { id: selected_genre_ids }).distinct
          end
      
          if @search_query.present?
            @book_reviews = @book_reviews.where("LOWER(title) LIKE ?", "%#{@search_query.downcase}%")
          end
      
          @all_reviews = BookReview.all
        end

        def show  
          @book_review = BookReview.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          redirect_to book_reviews_path
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
            Rails.logger.debug @book_review.errors.full_messages
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
          params.require(:book_review).permit(:title, :description_title, :rating, :body, :notes, :release_date, :page_count, :review_posted_date,
            :isbn, :publisher, :link, :image, genre_ids: [], author_ids: [])
        end
      end
