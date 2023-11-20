#rails generate scaffold User username:string first_name:string last_name:string email:string
#rake db:migrate is to complete the migrate
# rake db:rollback is to revert the changes 
class ApplicationController < ActionController::Base
end
