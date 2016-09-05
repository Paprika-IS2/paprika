require 'test_helper'

class TypeDishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_dish = type_dishes(:one)
  end

  test "should get index" do
    get type_dishes_url
    assert_response :success
  end

  test "should get new" do
    get new_type_dish_url
    assert_response :success
  end

  test "should create type_dish" do
    assert_difference('TypeDish.count') do
      post type_dishes_url, params: { type_dish: { name: @type_dish.name } }
    end

    assert_redirected_to type_dish_url(TypeDish.last)
  end

  test "should show type_dish" do
    get type_dish_url(@type_dish)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_dish_url(@type_dish)
    assert_response :success
  end

  test "should update type_dish" do
    patch type_dish_url(@type_dish), params: { type_dish: { name: @type_dish.name } }
    assert_redirected_to type_dish_url(@type_dish)
  end

  test "should destroy type_dish" do
    assert_difference('TypeDish.count', -1) do
      delete type_dish_url(@type_dish)
    end

    assert_redirected_to type_dishes_url
  end
end
