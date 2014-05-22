require "test_helper"

feature "Commenting on a post" do
  scenario "commenting as a site visitor" do
    # Given that I visit a post
    visit show_post_path(:visitor)

    # When I fill in a comment form and submit
    page.find("tr", :text => posts(:author).title).click_on "Show"
    click_on "Leave a comment"
    fill_in "Comment", with: "Trololol"
    click_on "Submit"

    # Then a comment will be posted on the page
    page.text.must_include "Trololol"
  end

  scenario "approving comments" do
    # Given that I see a good comment on a post
    sign_in(:editor)
    visit show_post_path
    title = posts(:editor).title
    page.find('tr', :text => title).click_on "Show"

    # When I click on the 'approved' button
    page.find('tr', :text => title).click_on "Show"
    click_on "Submit"

    # Then the comment will be visible
    page.text.must_include "This is a good comment"
end
