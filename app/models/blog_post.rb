#rails generate model BlogPost title:string body:text  
class BlogPost < ApplicationRecord
    before_save :set_content

    private
  
    def set_content
      self.content = ActionController::Base.helpers.sanitize(trix_content)
    end 
end
