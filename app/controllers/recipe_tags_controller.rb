class RecipeTagsController < ApplicationController
  before_action :set_recipe_tag, only: [:show, :edit, :update, :destroy]

  # GET /recipe_tags
  # GET /recipe_tags.json
  def index
    @recipe_tags = RecipeTag.all
  end

  # GET /recipe_tags/1
  # GET /recipe_tags/1.json
  def show
  end

  # GET /recipe_tags/new
  def new
    @recipe_tag = RecipeTag.new
  end

  # GET /recipe_tags/1/edit
  def edit
  end

  # POST /recipe_tags
  # POST /recipe_tags.json
  def create
    @recipe_tag = RecipeTag.new(recipe_tag_params)

    respond_to do |format|
      if @recipe_tag.save
        format.html { redirect_to @recipe_tag, notice: 'Recipe tag was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_tag }
      else
        format.html { render :new }
        format.json { render json: @recipe_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_tags/1
  # PATCH/PUT /recipe_tags/1.json
  def update
    respond_to do |format|
      if @recipe_tag.update(recipe_tag_params)
        format.html { redirect_to @recipe_tag, notice: 'Recipe tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_tag }
      else
        format.html { render :edit }
        format.json { render json: @recipe_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_tags/1
  # DELETE /recipe_tags/1.json
  def destroy
    @recipe_tag.destroy
    respond_to do |format|
      format.html { redirect_to recipe_tags_url, notice: 'Recipe tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_tag
      @recipe_tag = RecipeTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_tag_params
      params.require(:recipe_tag).permit(:recipe_id, :tag_id)
    end
end
