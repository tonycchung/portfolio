require "test_helper"

feature "As the site owner I want to delete some portfolio items and only show my best work" do
  scenario "deleting an existing project" do
    # Given an existing project
    visit projects_path
    # When I visit a single project
    first(:link, "Destroy").click
    # Then I can delete the project
    page.wont_have_content "My favorite sports"
    page.must_have_content projects(:portfolio).name
  end
end
