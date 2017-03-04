class MeetingsMailer < ApplicationMailer
  def new_invitation(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You have new invitation')
  end
end
