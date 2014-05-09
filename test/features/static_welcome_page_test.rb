require "test_helper"

feature "Welcome page" do
  scenario "has a title" do
    visit root_path
    welcome = "Welcome! I'm Tony Chung and this is my portfolio!"
    page.text.must_include "#{welcome}"
  end
end
