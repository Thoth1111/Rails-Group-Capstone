class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]

  # GET /recipes or /recipes.json
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  # Get /public_recipes
  def public_recipes
    @recipes = Recipe.where(public: true).includes(%i[user]).order(created_at: :desc)
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    @recipe.save

    respond_to(&:js)
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    authorize! :destroy, @recipe
    @recipe.destroy

    respond_to do |format|
      if @recipe.destroy
        format.html { redirect_to recipes_path, notice: 'Recipe was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to recipes_path, notice: 'Error deleting recipe' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
