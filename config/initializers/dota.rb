Dota.configure do |config|
  config.api_key = Rails.application.secrets[:steam_api_key]
end