require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    post = Post.create(title: posts(:cf).title, body: posts(:cf).body)
    visit posts_path(post)
    # When I click 'Edit' and submit changes
    page.find("tbody tr:last").click_on "Edit"
    fill_in "Title", with: posts(:np).title
    click_on "Update Post"
    # Then the post is updated
    page.text.must_include posts(:np).title
    page.text.must_include posts(:cf).body
  end
end
