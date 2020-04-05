class UsersController < ApplicationController
  def show
    @user = if username_params == current_user.username
              current_user
            else
              User.find_by(username: username_params)
            end

    @presenter = @user.present
  end

  def username_params
    params.require(:username)
  end
end
