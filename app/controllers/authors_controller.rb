class AuthorsController < ApplicationController
    def new
        @author = Author.new
        @existing_author = Author.all
    end

    def create
    @author = Author.new(author_params)
    if @author.save
        flash[:success] = 'Author created successfully.'
        redirect_to new_author_path
    else
        render 'new'
    end
    end

    def edit
        @author = Author.find(params[:id])
      end
    
      def update
        @author = Author.find(params[:id])
        if @author.update(author_params)
          flash[:success] = 'Author updated successfully.'
          redirect_to author_path(@author)
        else
          render 'edit'
        end
      end
    


    def destroy
        @author = Author.find(params[:id])
        if @author.destroy
          flash[:success] = 'Author deleted successfully.'
        else
          flash[:error] = 'Failed to delete author.'
        end
        redirect_to new_author_path
      end

    def show
        @author = Author.find(params[:id])
    end

    private

    def author_params
    params.require(:author).permit(:name)
    end
end