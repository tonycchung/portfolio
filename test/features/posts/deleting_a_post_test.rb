require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    title = posts(:cf).title
    visit posts_path
    # When I click 'Delete'
    page.must_have_content title
    page.find("tbody tr:last").click_on "Destroy"
    # The post is deleted
    page.wont_have_content title
    page.must_have_content posts(:np).title
  end
end
