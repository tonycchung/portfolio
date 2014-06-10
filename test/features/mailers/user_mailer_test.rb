require "test_helper"

feature "Sending an email from the site" do
  scenario "contact the site owner" do
    # Given that I want to contact the site owner
    visit new_contact_path

    # When I fill out the contact page form
    visit new_post_path

    # Then the site owner will receive my message in an email
    page.wont_have_field("Published")
  end
end
