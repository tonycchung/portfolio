require "test_helper"

# As the site owner, I want to add a portfolio item so that I can show off my work.
feature "Creating a new project" do
  scenario "submit form data to create a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: projects(:portfolio).name
    fill_in "Technologies used", with: projects(:portfolio).technologies_used
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.status_code.must_equal 200
  end

 scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    visit projects_path
    click_on "New Project"
    # When the form is submitted with a short name and missing technologies_used field
    fill_in "Name", with:"1"
    click_on "Create Project"
    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
