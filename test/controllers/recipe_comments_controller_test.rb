require 'test_helper'

class RecipeCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_comment = recipe_comments(:one)
  end

  test "should get index" do
    get recipe_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_comment_url
    assert_response :success
  end

  test "should create recipe_comment" do
    assert_difference('RecipeComment.count') do
      post recipe_comments_url, params: { recipe_comment: { comment: @recipe_comment.comment, created: @recipe_comment.created, recipe_id: @recipe_comment.recipe_id, user_id: @recipe_comment.user_id } }
    end

    assert_redirected_to recipe_comment_url(RecipeComment.last)
  end

  test "should show recipe_comment" do
    get recipe_comment_url(@recipe_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_comment_url(@recipe_comment)
    assert_response :success
  end

  test "should update recipe_comment" do
    patch recipe_comment_url(@recipe_comment), params: { recipe_comment: { comment: @recipe_comment.comment, created: @recipe_comment.created, recipe_id: @recipe_comment.recipe_id, user_id: @recipe_comment.user_id } }
    assert_redirected_to recipe_comment_url(@recipe_comment)
  end

  test "should destroy recipe_comment" do
    assert_difference('RecipeComment.count', -1) do
      delete recipe_comment_url(@recipe_comment)
    end

    assert_redirected_to recipe_comments_url
  end
end
