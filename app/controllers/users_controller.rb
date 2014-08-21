class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valid_user?


  def show
    @heading = "Your Latest Matches"
    @user = User.find(params[:id])
    @matchlist = []
    if session.key? :current_user
      @matches = Dota.history(:account_id => @user.uid,:matches_requested => 5).matches.collect{|m|Dota.match(m.id)}
    end
  end

end