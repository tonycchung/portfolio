require "test_helper"

feature "As the site owner I want to delete some portfolio items and only show my best work" do
  scenario "deleting an existing project" do
    # Given an existing project
    test_name = projects(:mysports).name
    visit projects_path
    # When I visit a single project
    first(:link, "Destroy").click
    # Then I can delete the project
    page.text.must_include "Project was successfully destroyed"
    page.text.wont_include test_name
  end
end
