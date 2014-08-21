class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @heading= "Latest Matches in Dota World"
    @matchlist = []
    if session.key? :current_user
      @matches = Dota.history(:matches_requested => 5).matches.collect{|m|Dota.match(m.id)}
    end
    render :template =>'users/show'
  end
end
