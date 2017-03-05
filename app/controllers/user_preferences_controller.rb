class UserPreferencesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user_days = current_user.days ? current_user.days.split(",") : []
  end

  def update
    current_user.update_attributes(
      from_hour: params[:from_hour].gsub(':00', ""),
      to_hour: params[:to_hour].gsub(':00', ""),
      days: params[:days_numbers].join(',')
    )
    redirect_to my_preferences_path, alert: "Your preferences has been updated!"
  end
end
