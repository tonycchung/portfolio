require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    # Given a completed new post form
    visit new_posts_path
    fill_in "Title", with: "Testing a New Post Title"
    fill_in "Body", with: "This is how I learn to make Rails apps"
    # When I submit a form
    click_on "Create Post"
    # Then a new post should be created and displayed
    page.text.must_include "New post created"
    page.text.must_include "This is how I learn to make Rails apps"
  end
end
