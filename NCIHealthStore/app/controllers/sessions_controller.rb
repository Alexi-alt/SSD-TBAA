class SessionsController < ApplicationController
    skip_before_action :authenticate_user!
    
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Welcome back!"
            redirect_to purchase_orders_path
        else 
            flash[:warning] = "Incorrect email or password. Please try again."
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "See you later!"
        redirect_to '/login'
    end
    
end
