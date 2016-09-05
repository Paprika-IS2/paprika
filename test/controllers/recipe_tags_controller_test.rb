require 'test_helper'

class RecipeTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_tag = recipe_tags(:one)
  end

  test "should get index" do
    get recipe_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_tag_url
    assert_response :success
  end

  test "should create recipe_tag" do
    assert_difference('RecipeTag.count') do
      post recipe_tags_url, params: { recipe_tag: { recipe_id: @recipe_tag.recipe_id, tag_id: @recipe_tag.tag_id } }
    end

    assert_redirected_to recipe_tag_url(RecipeTag.last)
  end

  test "should show recipe_tag" do
    get recipe_tag_url(@recipe_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_tag_url(@recipe_tag)
    assert_response :success
  end

  test "should update recipe_tag" do
    patch recipe_tag_url(@recipe_tag), params: { recipe_tag: { recipe_id: @recipe_tag.recipe_id, tag_id: @recipe_tag.tag_id } }
    assert_redirected_to recipe_tag_url(@recipe_tag)
  end

  test "should destroy recipe_tag" do
    assert_difference('RecipeTag.count', -1) do
      delete recipe_tag_url(@recipe_tag)
    end

    assert_redirected_to recipe_tags_url
  end
end
