class MeetingsMailer < ApplicationMailer
  def new_invitation(user, meeting)
    @user = user
    @meeting_id = Base64.encode64(meeting.id.to_s)
    mail(to: @user.email, subject: 'You have new invitation')
  end
end
