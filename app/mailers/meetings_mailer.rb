class MeetingsMailer < ApplicationMailer
  def new_invitation(user, url)
    @user = user
    @url = url
    mail(to: @user.email, subject: 'You have new invitation')
  end
end
