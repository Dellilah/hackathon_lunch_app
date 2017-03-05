module Api
  class UsersController < ::ApplicationController
    def with_ability
      current_user = User.find(params['current_user_id'])
      nearby_users =  current_user.nearbys(3).map(&:id)
      @users = Ability.where('lower(name) = ? AND id IN (?)', params['ability_name'].downcase, nearby_users).first.try(:users)
      if params["discarded_ids"].present?
        @users = @users.where.not(id: params["discarded_ids"].values)
      end
    end
  end
end
