#omniauth-steam =>https://github.com/reu/omniauth-steam
module Omniauth

  module Mock
    def auth_mock
      OmniAuth.config.mock_auth[:steam] =
          OmniAuth::AuthHash.new(
              {
                  :provider => "steam",
                  :uid => "76561198040502687",
                  :info => {
                      :nickname => "Rebel",
                      :name => "Rebel",
                      :location => "",
                      :image => "http://media.steampowered.com/steamcommunity/public/images/avatars/b5/b54980218a6870dfc257f0fae612e3ce3c0dd57d_medium.jpg",
                      :urls => {
                          :Profile => "http://steamcommunity.com/id/piratekp/"
                      }
                  },
                  :credentials => {},
                  :extra => {
                      :raw_info => {}
                  }
              }
          )
    end
  end

  module SessionHelpers
    def signin
      visit root_path
      expect(page).to have_link("Sign In")
      auth_mock
      click_link("Sign In")
    end
  end

end