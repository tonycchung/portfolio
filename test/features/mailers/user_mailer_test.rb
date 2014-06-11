require "test_helper"

feature "Sending an email from the site" do
  scenario "contact the site owner" do
    # Given that I want to contact the site owner
    visit new_contact_path

    # When I fill out the contact page form
    fill_in "Name", with: "Test contact"
    fill_in "Email", with: "testcontact@example.com"
    fill_in "Message", with: "Test message"
    click_on "Submit"

    # Then the site owner will receive my message in an email
    page.text.must_include "Your message has been sent!"
  end
end
