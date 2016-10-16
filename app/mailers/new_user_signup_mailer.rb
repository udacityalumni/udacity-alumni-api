class NewUserSignupMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Thank you for joining Udacity alumni network!" )
  end

end