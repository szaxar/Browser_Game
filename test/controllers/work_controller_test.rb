require 'test_helper'

class WorkControllerTest < ActionDispatch::IntegrationTest
  test "should get work" do
    get work_work_url
    assert_response :success
  end

end
