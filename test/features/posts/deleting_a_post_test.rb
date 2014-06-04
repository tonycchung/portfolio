require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted by an editor" do
    # Given an existing post
    sign_in(:editor)
    visit posts_path

    # When I delete a post as an editor
    title = posts(:editor).title
    page.must_have_content title
    page.find('tr', :text => title).click_on "Destroy"

    # Then the post will be deleted
    page.wont_have_content title
  end

  scenario "author cannot delete posts" do
    # Given that I'm an author
    sign_in(:author)

    # When I view my posts
    visit posts_path

    # I cannot delete them
    page.wont_have_content "Destroy"
end

  scenario "unathenticated site visitors cannot delete posts" do
    # Given that I visit the site without signing in
    # When I visit the blog index page
    visit posts_path

    # Then I should not see the "Destroy" button
    page.wont_have_content "Destroy"
  end
end
