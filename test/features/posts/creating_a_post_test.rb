require "test_helper"

feature "Creating A Post" do
  scenario "author creates a new post" do
    # Given an authorized user completes a new post form
    sign_in(:author)
    # When I create a post
    visit new_post_path
    fill_in "Title", with: "Test post!"
    fill_in "Body", with: "Test body!"
    click_on "Create Post"
    # Then a new post should be created and displayed with my name authored.
    page.text.must_include "Status: Unpublished"
    page.text.must_include "Post was successfully created"
    page.text.must_include "Test post!"
    page.text.must_include "Test body!"

    page.has_css? "#author"
    page.text.must_include users(:author).email
  end

  scenario "unathenticated site visitors cannot create posts" do
    # Given that I visit the site without signing in
    # When I visit the blog index page
    visit posts_path

    # Then I should not see the "New Post" button
    page.wont_have_link "New Post"
  end
end
