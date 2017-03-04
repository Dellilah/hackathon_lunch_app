module Api
  class UsersController < ::ApplicationController
    def with_ability
      @users = Ability.where('lower(name) = ?', params['ability_name'].downcase).first.try(:users)
      if params["discarded_ids"].present?
        @users = @users.where.not(id: params["discarded_ids"].values)
      end
    end
  end
end
