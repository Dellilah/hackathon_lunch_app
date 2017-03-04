class MeetingsController < ApplicationController
  def index
    @sent_by_me_meetings = Meeting.sent_by(current_user)
    @sent_to_me_meetings = Meeting.sent_to(current_user)
  end

  def confirm_from_email
    meeting_id = Base64.decode64(params[:meeting_id])
    @meeting = Meeting.find(meeting_id)
    @meeting.confirm
    MeetingsMailer.invitation_confirmed(@meeting.invitor, @meeting).deliver_later
    redirect_to my_meetings_path, alert: "You've succesfully confirmed a meeting'!"
  end
end
