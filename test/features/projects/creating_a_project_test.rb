require "test_helper"

# As the site owner, I want to add a portfolio item so that I can show off my work.
feature "Creating a new project" do
  scenario "submit form data to create a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with:"Code Fellows Portfolio"
    fill_in "Technologies used", with:"Ruby, Rails, Zurb Foundation"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?("#notice"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end
end
