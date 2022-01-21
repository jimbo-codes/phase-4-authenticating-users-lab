class SessionsController < ApplicationController

    def create
        user = User.find_by_username(params[:username])
        # byebug
        session[:user_id] = user.id
        render json: user
    end

    def destroy
        session.delete :user_id
        render json: {}, status: :no_content
    end

    def show
        user = User.find(session[:user_id])
        render json: user
    end
  end
  