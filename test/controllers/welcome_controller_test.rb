require "test_helper"

class WelcomeControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
