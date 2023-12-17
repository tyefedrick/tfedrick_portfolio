class ContactsController < ApplicationController
    def new
      # This action will render the contact form
    end
  
    def create
      # Here you will handle the form submission.
      # For now, let's just log the submitted data.
      Rails.logger.info "Contact Form Submitted: #{contact_params.inspect}"
  
      # Redirect to the homepage or display a success message.
      redirect_to root_path, notice: "Your message has been sent."
    end
  
    private
  
    def contact_params
      params.require(:contact).permit(:full_name, :email, :message)
    end
  end