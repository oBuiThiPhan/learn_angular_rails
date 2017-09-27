class RecipesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @recipes =
    if params[:keywords]
      Recipe.where('name LIKE :input', input: "%#{params[:keywords]}%")
    else
      []
    end
    respond_to do |format|
      format.html
      format.json{render json: @recipes.to_json}
    end
  end

  # def new
  # end

  def show
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      format.html
      format.json{render json: @recipe.to_json}
    end
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.save
    respond_to do |format|
      format.html {render 'show'}
      format.json{render json: @recipe.to_json, status: 201}
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes recipe_params
    respond_to do |format|
      format.html
      format.json{head :no_content}
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    respond_to do |format|
      format.html
      format.json{head :no_content}
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions)
  end
end
