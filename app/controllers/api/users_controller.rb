module Api
  class UsersController < ::ApplicationController
    def with_ability
      @users = Ability.where('lower(name) = ?', params['ability_name'].downcase).first.try(:users)
    end
  end
end
