class Match
  def self.parse_players(match)
    players =
        {:radiant=> [], :dire=> []}
    match.players.each do |player|
      account_id = player.id
      player_info = player.raw_player.deep_symbolize_keys
      profiles = Dota.profiles(player.id) if player.id

      player_info[:name] = if player.id == 4294967295
                             "Anonymous"
                           elsif player.leaver_status == :bot
                             "Bot"
                           else
                             profiles.first.real_name rescue player.id
                           end
      player_info[:items] = player.items
      if player.slot > 5
        players[:dire] << player_info
      else
        players[:radiant] << player_info
      end
    end
    players
  end

end