class UserMailer < ActionMailer::Base
  default from: 'anthonyuchung@gmail.com'
  def new_contact(contact)
    @contact = contact
    mail(to: 'anthonyuchung@gmail.com', subject: 'Message via Tony-Chung.com')
  end
end
