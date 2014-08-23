class MatchesController < ApplicationController

  def index
    @heading= "Latest Matches in Dota World"
    history = Dota.history(:start_at_match_id => params[:first_match_id])
    matches = history.matches
    @first_match_id = matches.first.id
    @pages = matches.paginate(:per_page => 5, :page => params[:page])
    @match_details = @pages.collect { |m| Dota.match(m.id) }
    render :template => 'users/show'
  end

  def show
    @match = Dota.match(params[:id])
    @heading = @match.winner == :radiant ? "RADIANT VICTORY" : "DIRE VICTORY"
    @players = Match.parse_players(@match)


  end

end