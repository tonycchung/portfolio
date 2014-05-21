require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    visit posts_path
    # When I click 'Edit' and submit changes
    page.find('tr', :text => posts(:cf).title).click_on "Edit"
    #page.find('tr', :test => posts(:lp).title).click_on "Destroy")

    fill_in "Title", with: "Edited title"
    click_on "Update Post"
    # Then the post is updated
    page.text.must_include "Edited title"
    page.text.must_include posts(:cf).body
  end
end
