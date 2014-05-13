require "test_helper"

feature "As a site visitor I want to see individual projects" do
  scenario "viewing a single project" do
    # Given some posted projects
    visit projects_path
    # When I click on a single project
    first(:link, "Show").click
    # Then I can view the individual project
    page.text.must_include "My favorite sports"
    page.text.wont_include "This is a fixture title"
  end
end
