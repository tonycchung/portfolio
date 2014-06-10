class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      UserMailer.new_contact(@contact).deliver
      redirect_to root_path, notice: 'Your message has been sent!'
    else
      render :new
    end
  end
end
