class RecipeScoresController < ApplicationController
  before_action :set_recipe_score, only: [:show, :edit, :update, :destroy]

  # GET /recipe_scores
  # GET /recipe_scores.json
  def index
    @recipe_scores = RecipeScore.all
  end

  # GET /recipe_scores/1
  # GET /recipe_scores/1.json
  def show
  end

  # GET /recipe_scores/new
  def new
    @recipe_score = RecipeScore.new
  end

  # GET /recipe_scores/1/edit
  def edit
  end

  # POST /recipe_scores
  # POST /recipe_scores.json
  def create
    @recipe_score = RecipeScore.new(recipe_score_params)

    respond_to do |format|
      if @recipe_score.save
        format.html { redirect_to @recipe_score, notice: 'Recipe score was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_score }
      else
        format.html { render :new }
        format.json { render json: @recipe_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_scores/1
  # PATCH/PUT /recipe_scores/1.json
  def update
    respond_to do |format|
      if @recipe_score.update(recipe_score_params)
        format.html { redirect_to @recipe_score, notice: 'Recipe score was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_score }
      else
        format.html { render :edit }
        format.json { render json: @recipe_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_scores/1
  # DELETE /recipe_scores/1.json
  def destroy
    @recipe_score.destroy
    respond_to do |format|
      format.html { redirect_to recipe_scores_url, notice: 'Recipe score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_score
      @recipe_score = RecipeScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_score_params
      params.require(:recipe_score).permit(:user_id, :recipe_id, :score)
    end
end
