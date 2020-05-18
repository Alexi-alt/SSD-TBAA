class UsersController < ApplicationController
    skip_before_action :authenticate_user!
    
    def new
    end

    def create 
        user = User.new(
            name: params[:name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation])

        if user.save
            session[:user_id] = user.id
            redirect_to purchase_orders_path, notice: "Welcome to NCI Health Store!"
        else
            flash[:warning] = user.errors.full_messages.first
            redirect_to '/signup'
        end
    end
    
end
