class MeetingsMailer < ApplicationMailer
  def new_invitation(user, meeting, confirm_url, reject_url)
    @user = user
    @meeting = meeting
    @confirm_url = confirm_url
    @reject_url = reject_url
    mail(to: @user.email, subject: 'You have new invitation')
  end

  def invitation_confirmed(user, meeting)
    @user = user
    @meeting = meeting
    mail(to: @user.email, subject: 'Your invitation has been confirmed')
  end

  def invitation_rejected(user, meeting)
    @user = user
    @meeting = meeting
    mail(to: @user.email, subject: 'Your invitation has been rejected')
  end
end
