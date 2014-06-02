require "test_helper"

def new_comment
  click_on "Leave a comment"
  fill_in "Author", with: "Troll"
  fill_in "Content", with: "Trololol"
  click_on "Create Comment"
end

feature "Commenting on a post" do
  scenario "commenting as a site visitor" do
    # Given that I visit a post
    visit posts_path
    title = posts(:editor).title

    # When I fill in a comment form and submit
    page.find("tr", :text => title).click_on "Show"
    new_comment

    # Then a comment will be created but won't show up on the page
    page.text.must_include "Comment was successfully created"
    page.text.wont_include "Trololol"
  end

  scenario "approving good comments as an editor" do
    # Given that I see a good comment on a post
    sign_in(:editor)
    visit posts_path
    title = posts(:author).title
    page.find('tr', :text => title).click_on "Show"

    # When I click on the 'approved' button
    page.find('tr', :text => comments(:good_comment_unauth).content).click_on "Edit"
    check 'Approved'
    click_on "Update Comment"

    # Then the comment will be visible to a visitor
    click_on "Sign out"
    visit posts_path
    page.find('tr', :text => title).click_on "Show"
    page.text.must_include "This comment will rule"
  end

  scenario "see approved comment as a visitor" do
    # Given that I am a visitor
    # When I view a post
    visit posts_path
    title = posts(:editor).title
    page.find('tr', :text => title).click_on "Show"

    # Then I will only see approved comments
    page.text.must_include "This comment rules"
    page.text.wont_include "This comment sucks"
  end
end

feature "Commenting on projects" do
  scenario "commenting as a site visitor" do
  # Given that I view a project
  visit projects_path

  # When I fill in a comment form and submit it
  page.find("tr", :text => projects(:portfolio).name).click_on "Show"
  new_comment

  # Then a comment will be posted on the project page
  page.text.must_include "Comment was successfully created"
  end
end
