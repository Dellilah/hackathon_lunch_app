require 'net/http'
require 'uri'
require 'json'
require 'mime/types'

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
    send_sms(@meeting.invitor, @meeting)
    redirect_to my_meetings_path, alert: "You've succesfully confirmed a meeting'!"
  end

  def reject_from_email
    meeting_id = Base64.decode64(params[:meeting_id])
    @meeting = Meeting.find(meeting_id)
    @meeting.reject
    MeetingsMailer.invitation_rejected(@meeting.invitor, @meeting).deliver_later
    send_sms(@meeting.invitor, @meeting)
    redirect_to my_meetings_path, alert: "You've succesfully rejected a meeting."
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
