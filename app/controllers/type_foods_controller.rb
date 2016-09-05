class TypeFoodsController < ApplicationController
  before_action :set_type_food, only: [:show, :edit, :update, :destroy]

  # GET /type_foods
  # GET /type_foods.json
  def index
    @type_foods = TypeFood.all
  end

  # GET /type_foods/1
  # GET /type_foods/1.json
  def show
  end

  # GET /type_foods/new
  def new
    @type_food = TypeFood.new
  end

  # GET /type_foods/1/edit
  def edit
  end

  # POST /type_foods
  # POST /type_foods.json
  def create
    @type_food = TypeFood.new(type_food_params)

    respond_to do |format|
      if @type_food.save
        format.html { redirect_to @type_food, notice: 'Type food was successfully created.' }
        format.json { render :show, status: :created, location: @type_food }
      else
        format.html { render :new }
        format.json { render json: @type_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_foods/1
  # PATCH/PUT /type_foods/1.json
  def update
    respond_to do |format|
      if @type_food.update(type_food_params)
        format.html { redirect_to @type_food, notice: 'Type food was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_food }
      else
        format.html { render :edit }
        format.json { render json: @type_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_foods/1
  # DELETE /type_foods/1.json
  def destroy
    @type_food.destroy
    respond_to do |format|
      format.html { redirect_to type_foods_url, notice: 'Type food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_food
      @type_food = TypeFood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_food_params
      params.require(:type_food).permit(:name)
    end
end
