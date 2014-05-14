require "test_helper"

# As the site owner, I want to restrict who can access the site so I don't get alot of spam.
feature "As a site visitor, I want to be able to create my own account
        so that I can save my actions and settings" do
  scenario "Sign up" do
    # Given when I visit the sign up page
    visit '/users/sign_up'
    # When I fill in my information
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "asdfasdf"
    fill_in "Password confirmation", with: "asdfasdf"
    click_button "Sign up"
    # Then a new account will be made for me
    puts page.body
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "Password confirmation doesn't match Password"
    page.wont_have_content "Password is too short (minimum is 8 characters)"
  end
end
