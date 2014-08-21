class MatchesController < ApplicationController
  before_filter :authenticate_user!


  def show
       @match = Dota.match(params[:id])
       @heading = @match.winner  == :radiant ? "RADIANT VICTORY": "DIRE VICTORY"
       @players = Match.parse_players(@match)
    p @players


  end

end