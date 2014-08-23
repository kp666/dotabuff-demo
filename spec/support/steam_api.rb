
  def stub_match_history
    @match_history_response_file ||= File.new("spec/support/data/GetMatchHistory.response").read
    stub_request(:any, /https:\/\/api.steampowered.com\/IDOTA2Match_570\/GetMatchHistory\/V001/).to_return(@match_history_response_file)
  end

  def stub_match_details
    @match_details_response_file ||= File.new("spec/support/data/GetMatchDetails.response").read
    stub_request(:any, /https:\/\/api.steampowered.com\/IDOTA2Match_570\/GetMatchDetails\/V001/).to_return(@match_details_response_file)
  end

