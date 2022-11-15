class UsersController < ApplicationController
    def new
        if logged_in?
            redirect_to cats_url
        else
            @user = User.new
            render :new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to cats_url
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :session_token, :password_digest, :password)
    end

end