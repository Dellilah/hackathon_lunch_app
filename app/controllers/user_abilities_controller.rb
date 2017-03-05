class UserAbilitiesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @abilities = Ability.all
    @user_abilities = current_user.abilities
  end

  def update
    current_user.abilities = Ability.where(id: params["abilities_ids"])
    current_user.update_attributes(good_at: params["good_at"], looking_for: params["looking_for"])
    redirect_to my_abilities_path, alert: "Your abilities has been updated!"
  end
end
