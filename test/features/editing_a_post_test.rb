require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path(post)
    # When I click 'Edit' and submit changes
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"
    # Then the post is updated
    page.text.must_include "Becoming a Web Developer"
    page.text.must_include "Means striving for excellence."
  end
end
