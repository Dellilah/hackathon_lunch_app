module Api
  class MeetingsController < ::ApplicationController
    skip_before_action :verify_authenticity_token

    def new
      @meeting = Meeting.create(invitor_id: params["invitor_id"], invited_id: params["invited_id"], status: "new")
      @invited = User.find(params["invited_id"])
      url = confirm_meeting_url((Base64.encode64(@meeting.id.to_s)), host: request.host_with_port )
      MeetingsMailer.new_invitation(@invited, url).deliver_later
      render json: {}, status: :ok
    end

    def waiting_for_confirmation
      @user = User.find(params[:current_user_id])
      @waiting_meetings = Meeting.sent_to(@user).where(status: "new")
    end

    def confirm
      @meeting = Meeting.find(params[:meeting_id])
      @meeting.confirm
      render json: {}, status: :ok
    end

    def reject
      @meeting = Meeting.find(params[:meeting_id])
      @meeting.reject
      render json: {}, status: :ok
    end
  end
end
