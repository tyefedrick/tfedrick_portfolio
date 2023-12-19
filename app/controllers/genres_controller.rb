
    class GenresController < ApplicationController
        def new
            @genre = Genre.new
            @existing_genres = Genre.all
        end
    
        def create
        @genre = Genre.new(genre_params)
        if @genre.save
            flash[:success] = 'Genre created successfully.'
            redirect_to new_genre_path
        else
            render 'new'
        end
        end
    
        private
    
        def genre_params
        params.require(:genre).permit(:name)
        end
    end
