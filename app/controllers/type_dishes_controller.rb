class TypeDishesController < ApplicationController
  before_action :set_type_dish, only: [:show, :edit, :update, :destroy]

  # GET /type_dishes
  # GET /type_dishes.json
  def index
    @type_dishes = TypeDish.all
  end

  # GET /type_dishes/1
  # GET /type_dishes/1.json
  def show
  end

  # GET /type_dishes/new
  def new
    @type_dish = TypeDish.new
  end

  # GET /type_dishes/1/edit
  def edit
  end

  # POST /type_dishes
  # POST /type_dishes.json
  def create
    @type_dish = TypeDish.new(type_dish_params)

    respond_to do |format|
      if @type_dish.save
        format.html { redirect_to @type_dish, notice: 'Type dish was successfully created.' }
        format.json { render :show, status: :created, location: @type_dish }
      else
        format.html { render :new }
        format.json { render json: @type_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_dishes/1
  # PATCH/PUT /type_dishes/1.json
  def update
    respond_to do |format|
      if @type_dish.update(type_dish_params)
        format.html { redirect_to @type_dish, notice: 'Type dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_dish }
      else
        format.html { render :edit }
        format.json { render json: @type_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_dishes/1
  # DELETE /type_dishes/1.json
  def destroy
    @type_dish.destroy
    respond_to do |format|
      format.html { redirect_to type_dishes_url, notice: 'Type dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_dish
      @type_dish = TypeDish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_dish_params
      params.require(:type_dish).permit(:name)
    end
end
