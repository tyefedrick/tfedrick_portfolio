# The name of the file has to match the action. A new file for every action is required.

class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show  
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to blog_posts_path
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(title: params[:blog_post][:title], body: params[:blog_post][:body])
    @blog_post.save
#I need to add a notice. 
    redirect_to blog_post_url(@blog_post),notice: "Blog Post Created Successfully!"
  end
end

