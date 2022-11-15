class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.error.full_message, status: 422
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :session_token, :password_digest, :password)
    end

end