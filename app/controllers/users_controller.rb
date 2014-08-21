class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valid_user?


  def show
    @heading = "Your Latest Matches"
    @user = User.find(params[:id])
    @matchlist = []
    if session.key? :current_user
      history = Dota.history(:account_id => @user.uid,:start_at_match_id => params[:first_match_id])
      matches = history.matches
      @first_match_id = matches.first.id
    end
    @pages = matches.paginate(:per_page => 5,:page => params[:page])
    @match_details  = @pages.collect{|m|Dota.match(m.id)}
  end

end