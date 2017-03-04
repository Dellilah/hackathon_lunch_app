class MeetingsController < ApplicationController
  def index
    @sent_by_me_meetings = Meeting.sent_by(current_user)
    @sent_to_me_meetings = Meeting.sent_to(current_user)
  end
end
