class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valid_user?


  def show
    @user = User.find(params[:id])
  end

end