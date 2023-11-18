class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show  
    @log_post = BlogPost.find(params{:id})
  rescue ActiveRecord::RecordNotFound
    redirect_to blog_posts_path
  end
end

