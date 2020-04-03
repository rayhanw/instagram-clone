class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @presenter = @user.present
  end
end
