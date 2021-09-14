class RecipesController < ApplicationController

    def create
        recipe = Recipe.create(recipe_params)

        if recipe.valid?
            render json: recipe
        else
            render json: {message: 'recipe failed'}
        end
    end

    def destroy
        recipe = Recipe.find(params[:id])
        ingredients = recipe.ingredients
        if ingredients.count > 0
        ingredients.each{|i| i.destroy}
        recipe.destroy
        render json: recipe
        else
            recipe.destroy
            render json: {message: 'recipe deleted, no ingredients'}
        end
    end

    private

    def recipe_params
        params.permit(:calories, :image, :name, :recipe, :cell_id, :user_id)
    end

end
