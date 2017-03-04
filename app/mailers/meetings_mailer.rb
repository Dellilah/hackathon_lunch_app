class MeetingsMailer < ApplicationMailer
  def new_invitation(user, url)
    @user = user
    @url = url
    mail(to: @user.email, subject: 'You have new invitation')
  end

  def invitation_confirmed(user, meeting)
    @user = user
    @meeting = meeting
    mail(to: @user.email, subject: 'Your invitation has been confirmed')
  end
end
