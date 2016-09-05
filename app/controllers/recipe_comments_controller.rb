class RecipeCommentsController < ApplicationController
  before_action :set_recipe_comment, only: [:show, :edit, :update, :destroy]

  # GET /recipe_comments
  # GET /recipe_comments.json
  def index
    @recipe_comments = RecipeComment.all
  end

  # GET /recipe_comments/1
  # GET /recipe_comments/1.json
  def show
  end

  # GET /recipe_comments/new
  def new
    @recipe_comment = RecipeComment.new
  end

  # GET /recipe_comments/1/edit
  def edit
  end

  # POST /recipe_comments
  # POST /recipe_comments.json
  def create
    @recipe_comment = RecipeComment.new(recipe_comment_params)

    respond_to do |format|
      if @recipe_comment.save
        format.html { redirect_to @recipe_comment, notice: 'Recipe comment was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_comment }
      else
        format.html { render :new }
        format.json { render json: @recipe_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_comments/1
  # PATCH/PUT /recipe_comments/1.json
  def update
    respond_to do |format|
      if @recipe_comment.update(recipe_comment_params)
        format.html { redirect_to @recipe_comment, notice: 'Recipe comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_comment }
      else
        format.html { render :edit }
        format.json { render json: @recipe_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_comments/1
  # DELETE /recipe_comments/1.json
  def destroy
    @recipe_comment.destroy
    respond_to do |format|
      format.html { redirect_to recipe_comments_url, notice: 'Recipe comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_comment
      @recipe_comment = RecipeComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_comment_params
      params.require(:recipe_comment).permit(:user_id, :recipe_id, :comment, :created)
    end
end
