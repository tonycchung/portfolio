require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    # Given an authorized user completes a new post form
    sign_in()
    # When I create a post
    visit new_post_path
    fill_in "Title", with: 'Test post!'
    fill_in "Body", with: 'Test body!'
    click_on "Create Post"
    # Then a new post should be created and displayed with my name authored.
    page.text.must_include "Post was successfully created"
    page.text.must_include 'Test post!'
    page.text.must_include 'Test body!'

    page.has_css? "#author"
    page.text.must_include users(:yin).email
  end
end
