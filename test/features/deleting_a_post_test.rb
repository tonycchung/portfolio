require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    post = posts(:cf)
    visit posts_path
    # When I click 'Delete'
    page.find("tbody tr:last").click_on "Destroy"
    # The post is deleted
    page.wont_have_content posts(:cf).title
  end
end

# feature "Deleting A Post" do
#   scenario "post is deleted with a click" do
#     # Given an existing post
#     post = Post.create(title: "Hello", body: "Goodbye")
#     visit posts_path
#     # When I click 'Delete'
#     page.find("tbody tr:last").click_on "Destroy"
#     # The post is deleted
#     page.wont_have_content "Hello"
#   end
# end
