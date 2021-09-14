class IngredientsController < ApplicationController

    def create
        ingredient = Ingredient.create(ingredient_params)

        if ingredient.valid?
            render json: ingredient
        else
            render json: {message: 'failed'}
        end
    end

    private

    def ingredient_params
        params.permit(:name, :recipe_id)
    end

end
