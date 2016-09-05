require 'test_helper'

class RecipeScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_score = recipe_scores(:one)
  end

  test "should get index" do
    get recipe_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_score_url
    assert_response :success
  end

  test "should create recipe_score" do
    assert_difference('RecipeScore.count') do
      post recipe_scores_url, params: { recipe_score: { recipe_id: @recipe_score.recipe_id, score: @recipe_score.score, user_id: @recipe_score.user_id } }
    end

    assert_redirected_to recipe_score_url(RecipeScore.last)
  end

  test "should show recipe_score" do
    get recipe_score_url(@recipe_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_score_url(@recipe_score)
    assert_response :success
  end

  test "should update recipe_score" do
    patch recipe_score_url(@recipe_score), params: { recipe_score: { recipe_id: @recipe_score.recipe_id, score: @recipe_score.score, user_id: @recipe_score.user_id } }
    assert_redirected_to recipe_score_url(@recipe_score)
  end

  test "should destroy recipe_score" do
    assert_difference('RecipeScore.count', -1) do
      delete recipe_score_url(@recipe_score)
    end

    assert_redirected_to recipe_scores_url
  end
end
