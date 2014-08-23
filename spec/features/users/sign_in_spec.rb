feature 'Sign in', :omniauth do

before do

end
  scenario "users can sign in with valid account" do
    signin
    expect(page).to have_content("Sign Out")
  end

  scenario 'users cannot sign in with invalid account' do
    OmniAuth.config.mock_auth[:steam] = :invalid_credentials
    visit root_path
    expect(page).to have_link("Sign In")
    click_link("Sign In")
    expect(page).to have_content('Authentication error')
  end

end