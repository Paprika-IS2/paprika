require 'test_helper'

class TypeFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_food = type_foods(:one)
  end

  test "should get index" do
    get type_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_type_food_url
    assert_response :success
  end

  test "should create type_food" do
    assert_difference('TypeFood.count') do
      post type_foods_url, params: { type_food: { name: @type_food.name } }
    end

    assert_redirected_to type_food_url(TypeFood.last)
  end

  test "should show type_food" do
    get type_food_url(@type_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_food_url(@type_food)
    assert_response :success
  end

  test "should update type_food" do
    patch type_food_url(@type_food), params: { type_food: { name: @type_food.name } }
    assert_redirected_to type_food_url(@type_food)
  end

  test "should destroy type_food" do
    assert_difference('TypeFood.count', -1) do
      delete type_food_url(@type_food)
    end

    assert_redirected_to type_foods_url
  end
end
