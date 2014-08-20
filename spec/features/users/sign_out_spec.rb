
feature 'Sign out', :omniauth do

  scenario 'users signs out successfully' do
    signin
    click_link 'Sign Out'
    expect(page).to have_content 'Signed out!'
  end

end