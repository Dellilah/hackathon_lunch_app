module Api
  class MeetingsController < ::ApplicationController
    skip_before_action :verify_authenticity_token

    def new
      puts "*"*100
      puts params
      puts "*"*100
      render json: {}, status: :ok
    end
  end
end
