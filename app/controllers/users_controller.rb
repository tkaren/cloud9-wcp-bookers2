class UsersController < ApplicationController
  def index
    @user = User.find(params[:])
  end
end
