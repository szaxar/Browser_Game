require 'test_helper'

class TrainerControllerTest < ActionDispatch::IntegrationTest
  test "should get training" do
    get trainer_training_url
    assert_response :success
  end

end
