class UserMailer < ApplicationMailer

def welcome_email(user , rnumber)
    @user=user
    @random=rnumber
   mail(to:@user.email , from:'sunil.prajapati590@rediffmail.com', subject:'welcome to Linkedin.com')
  end

end
