module Api
  class UsersController < ::ApplicationController
    def with_ability
      @users = Ability.find_by_name(params[:ability_name]).try(:users)
    end
  end
end
