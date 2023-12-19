
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

        def edit
            @genre = Genre.find(params[:id])
          end
        
          def update
            @genre = Genre.find(params[:id])
            if @genre.update(genre_params)
              flash[:success] = 'Genre updated successfully.'
              redirect_to genre_path(@genre)
            else
              render 'edit'
            end
          end
        


        def destroy
            @genre = Genre.find(params[:id])
            if @genre.destroy
              flash[:success] = 'Genre deleted successfully.'
            else
              flash[:error] = 'Failed to delete genre.'
            end
            redirect_to new_genre_path
          end

        def show
            @genre = Genre.find(params[:id])
        end
    
        private
    
        def genre_params
        params.require(:genre).permit(:name)
        end
    end
