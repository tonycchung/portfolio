class WelcomeController < ApplicationController
  def index
  end

  def contact
  end

  def message
    name = params[:name]
    email = params[:email]
    message = params[:message]

    unless name.empty? || email.empty? || message.empty?
      UserMailer.new_contact(name, email, message).deliver
      redirect_to root_path, notice: 'Thanks for your message!'
    else
      redirect_to '/contact', notice: 'Please fill out all fields!'
    end
  end
end
