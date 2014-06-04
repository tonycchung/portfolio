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
end
