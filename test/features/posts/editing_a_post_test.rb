require "test_helper"

feature "Editing A Post" do
  scenario "editing a post as an the author" do
    # Given I view an existing post as an author
    sign_in(:author)
    visit posts_path

    # When I edit a post and submit changes
    title = posts(:author).title
    page.find('tr', :text => title).click_on "Edit"
    fill_in "Title", with: "Title edited by author"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Title edited by author"
    page.text.must_include posts(:author).body
  end

  scenario "editing a post as an editor" do
    # Given that I view an existing post as an editor
    sign_in(:editor)
    visit posts_path

    # When I edit a post and submit
    title = posts(:editor).title
    page.find('tr', :text => title).click_on "Edit"
    fill_in "Title", with: "Title edited by editor"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Title edited by editor"
    page.text.must_include posts(:editor).body
  end

  scenario "unathenticated site visitors cannot edit posts" do
    # Given that I visit the site without signing in
    # When I visit the blog index page
    visit posts_path

    # Then I should not see the "Edit" button
    page.wont_have_content "Edit"
  end
end
