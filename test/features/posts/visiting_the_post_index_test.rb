require "test_helper"

feature "Visiting The Post Index" do
  scenario "viewing only published posts as a visitor" do
    # Given the existing posts
    # When I view the posts as a visitor
    visit posts_path

    # I will only see the published posts
    page.text.wont_include posts(:crap).title
    page.text.must_include posts(:editor).title
    page.text.must_include posts(:author).title
  end

  scenario "viewing posts as an author" do
    # Given that I sign in as an author
    sign_in(:author)

    # When I visit the posts page
    visit posts_path

    # I will only see my own posts
    page.text.must_include posts(:author).title
    page.text.wont_include posts(:editor).title
    page.text.wont_include posts(:crap).title
  end

  scenario "viewing posts as an editor" do
    # Given that I sign in as an editor
    sign_in(:editor)

    # When I view the posts page
    visit posts_path

    # I will be able to see all posts
    page.text.must_include posts(:author).title
    page.text.must_include posts(:editor).title
    page.text.must_include posts(:crap).title
  end
end
