#rails generate model BlogPost title:string body:text  
class BlogPost < ApplicationRecord
  has_rich_text:body

    validates :body, presence: true
end
