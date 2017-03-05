require 'net/http'
require 'uri'
require 'json'
require 'mime/types'

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
      MeetingsMailer.invitation_confirmed(@meeting.invitor, @meeting).deliver_later
      send_sms(@meeting.invitor, @meeting)
      render json: {}, status: :ok
    end

    def reject
      @meeting = Meeting.find(params[:meeting_id])
      @meeting.reject
      MeetingsMailer.invitation_rejected(@meeting.invitor, @meeting).deliver_later
      send_sms(@meeting.invitor, @meeting)
      render json: {}, status: :ok
    end

    def send_sms(user, meeting)
      uri = URI.parse("https://rest.nexmo.com/sms/json")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
      request.body = {
        api_key: ENV['nexmo_api_key'],
        api_secret: ENV['nexmo_api_secret'],
        to: user.phone_number.gsub(/\+|\-|\s/, ""),
        from: 'Lunch App',
        text: "Your invitation to lunch with #{meeting.invited.first_name} has been #{meeting.status}."
      }.to_json

      response = http.request(request)
    end
  end
end
