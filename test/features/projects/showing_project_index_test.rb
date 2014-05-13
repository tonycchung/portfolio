require "test_helper"

feature "As a user, I want to see the developer's portfolio" do
  scenario "view projects" do
    # Given some posted projects

    # When I visit the projects index page
    visit projects_path
    # Then I can see all the projects
    page.text.must_include projects(:portfolio).name
    page.text.must_include projects(:mysports).name
  end
end
