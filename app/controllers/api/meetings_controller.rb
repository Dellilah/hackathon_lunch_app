module Api
  class MeetingsController < ::ApplicationController
    skip_before_action :verify_authenticity_token

    def new
      Meeting.create(invitor_id: params["invitor_id"], invited_id: params["invited_id"], status: "new")
      render json: {}, status: :ok
    end
  end
end
