class UsersController < ApplicationController

    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id 
            render json: user, status: :created
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def recipes
        user = User.find_by(id: session[:user_id])

        if user
            recipes = user.recipes
            render json: recipes
        else
            render json: {message: "no user signed in"}
        end
    end

    def ingredients
        user = User.find_by(id: session[:user_id])

        if user
            recipes = user.recipes
            if recipes.count > 0
                ingredients = []
                recipes.each do |r|
                    ingreds = r.ingredients
                    ingredients << ingreds
                end
                render json: ingredients
            else
                render json: {message: 'no recipes'}
            end
        else
            render json: {message: 'no user signed in'}
        end
    end

    private 
    def user_params
        params.permit(:name, :password, :email)
    end

end
