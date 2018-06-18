require 'test_helper'

class GuildesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guilde = guildes(:one)
  end

  test "should get index" do
    get guildes_url
    assert_response :success
  end

  test "should get new" do
    get new_guilde_url
    assert_response :success
  end

  test "should create guilde" do
    assert_difference('Guilde.count') do
      post guildes_url, params: { guilde: { max_members: @guilde.max_members, name: @guilde.name } }
    end

    assert_redirected_to guilde_url(Guilde.last)
  end

  test "should show guilde" do
    get guilde_url(@guilde)
    assert_response :success
  end

  test "should get edit" do
    get edit_guilde_url(@guilde)
    assert_response :success
  end

  test "should update guilde" do
    patch guilde_url(@guilde), params: { guilde: { max_members: @guilde.max_members, name: @guilde.name } }
    assert_redirected_to guilde_url(@guilde)
  end

  test "should destroy guilde" do
    assert_difference('Guilde.count', -1) do
      delete guilde_url(@guilde)
    end

    assert_redirected_to guildes_url
  end
end
