require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typos" do
  scenario "editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:portfolio))

    # When I make changes
    fill_in "Name", with: projects(:portfolio).name

    # Then the changes should be saved and shown
    click_on "Update Project"
    page.text.must_include "Project changes have been saved"
    page.text.must_include projects(:portfolio).name
    page.text.wont_include "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:portfolio))
    # When I submit invalid changes
    fill_in "Name", with:"ah"
    click_on "Update Project"
    # Then the changes should not be saved, and I should get to try again
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end
