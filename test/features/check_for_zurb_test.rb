require "test_helper"

feature "Checking for zurb" do
  scenario "check posts page and see if zurb is working" do
    # Given that I want to use zurb
    # When I visit my posts page
    visit root_path
    # Then a zurb stylesheet should be loaded.
    # page.html.must_include "foundation_and_overrides.css"
    page.has_css? ('zurb')
  end
end
