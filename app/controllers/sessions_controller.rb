class SessionsController < ApplicationController

    def create
       
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: {id: user.id, name: user.name}
        else
            render json: {error: ["invalid email and/or password"]}
        end

    end

    def show
        user = User.find_by(id: session[:user_id])

        if user
            render json: user
        else
            render json: {message: "no user signed in"}
        end
    end

end
