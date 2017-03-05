module Api
  class UsersController < ::ApplicationController
    def with_ability
      current_user = User.find(params['current_user_id'])
      nearby_users =  current_user.nearbys(3).map(&:id)
      @users = Ability.where('lower(name) = ?', params['ability_name'].downcase).first.try(:users)
      @users = @users.where(id: nearby_users) if @users
      if params["discarded_ids"].present?
        @users = @users.where.not(id: params["discarded_ids"].values)
      end
    end

    def with_ability_and_datetime
      current_user = User.find(params['current_user_id'])
      nearby_users =  current_user.nearbys(3).map(&:id)
      puts "*"*100
      puts params['time'].gsub(":00", "").to_i
      puts "*"*100
      @users = Ability.where('lower(name) = ?', params['ability_name'].downcase).first.try(:users)
      if @users
        @users = @users.where(id: nearby_users)
        @users = @users.select { |user|
          user.days &&
          user.days.split(',').include?(params['day_number']) &&
          user.from_hour.to_i <= params['time'].gsub(":00", "").to_i &&
          user.to_hour.to_i >= params['time'].gsub(":00", "").to_i
        }
      end
      if params["discarded_ids"].present?
        @users = @users.where.not(id: params["discarded_ids"].values)
      end
    end
  end
end
