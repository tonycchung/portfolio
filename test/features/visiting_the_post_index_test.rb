require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts" do
    # Given existing posts
    Post.create(title: posts(:cf).title, body: posts(:cf).body)
    # When I visit /posts
    visit posts_path
    # Then the existing posts should be loaded
    page.text.must_include posts(:cf).title
  end
end
