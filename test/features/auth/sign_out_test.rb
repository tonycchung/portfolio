require "test_helper"

# As the site owner I want my visitors to be able to sign out of their accounts so that their accounts won't be abused.
feature "As a site visitor I want to be able to sign out of my account
        so that I can prevent others from using my account if they have my computer." do
  scenario "Sign out" do
    # Given that I sign in with an existing user
    visit '/users/sign_in'
    fill_in "Email", with: users(:yin).email
    fill_in "Password", with: "yinyinyin"
    click_button "Sign in"
    # When I click on the sign out link
    click_on "Sign out"
    #{ }I will be signed out of my account
    page.must_have_content "Signed out successfully."
    page.wont_have_content "Signed in as #{users(:yin).email}"
  end
end
