require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: "Test Title"
    fill_in "Body", with: "Test Body"
    # When I submit a form
    click_on "Create Post"
    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "Test Title"
    page.text.must_include "Test Body"
  end
end
