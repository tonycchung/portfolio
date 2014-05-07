require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path(post)
    # When I click 'Delete'
    page.find("tr:last").click_on "Destroy"
    # The post is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end
