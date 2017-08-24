class RecipesController < ApplicationController
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
end
