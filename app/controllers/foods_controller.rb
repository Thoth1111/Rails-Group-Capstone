class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @foods = current_user ? current_user.foods : []
  end

  # GET /general_shopping_list
  def general_shopping_list
    my_foods = current_user.foods
    required_foods = current_user.recipes.includes(:foods).map(&:foods).flatten

    @missing_foods = required_foods.reject do |required_food|
      my_foods.any? { |my_food| my_food.name == required_food.name }
    end

    @missing_foods = merge_duplicate_foods(@missing_foods)

    @total_items = @missing_foods.size
    @total_price = @missing_foods.reduce(0) { |sum, food| sum + (food.price * food.quantity) }
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(**food_params, user_id: current_user.id)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url(@food), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(**food_params, user_id: current_user.id)
        format.html { redirect_to foods_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def merge_duplicate_foods(all_foods)
    all_foods.group_by(&:name).map do |_, foods|
      foods.reduce do |merged_food, food|
        merged_food.quantity += food.quantity
        merged_food
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
