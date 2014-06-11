require "test_helper"

feature "As a site visitor I want to sign into my account so I can
        access my settings and posts." do
  scenario "Sign in" do
    # Given that I access the sign in page
    visit '/users/sign_in'
    # When I input my account credentials
    fill_in "Email", with: users(:editor).email
    fill_in "Password", with: "password"
    click_button "Sign in"
    # I will be signed into my account
    page.must_have_content "Signed in successfully"
    page.wont_have_content "Password confirmation doesn't match Password"
    page.wont_have_content "Password is too short (minimum is 8 characters)"
  end

  scenario "sign in with twitter works" do
   visit root_path
   click_on "Sign in"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   # save_and_open_page
   page.must_have_content "test_twitter_user, you are signed in!"
  end
end
