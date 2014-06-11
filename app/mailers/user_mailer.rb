
class UserMailer < ActionMailer::Base
  default from: 'tonychung1110@gmail.com'
  def new_contact(contact)
    @contact = contact
    mail(to: 'tonychung1110@gmail.com', subject: 'Message via Tony-Chung.com')
  end
end
