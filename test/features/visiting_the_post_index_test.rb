require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts" do
    # Given existing posts
    Post.create(title: "3 Days In: Code Fellows Thus Far", body: "In a nutshell it's very long and difficult...but SO MUCH FUN!")
    # When I visit /posts
    visit posts_path
    # Then the existing posts should be loaded
    page.text.must_include "3 Days In: Code Fellows Thus Far"
  end
end
