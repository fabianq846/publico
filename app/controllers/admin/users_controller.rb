module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:edit, :update, :destroy]
    before_action :verify_admin

    def new
      @user = User.new
    end

    def index
      @users = User.all
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: 'Usuario creado exitosamente.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'Usuario actualizado exitosamente.'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'Usuario eliminado exitosamente.'
    end

    private

    def verify_admin
      redirect_to root_path, alert: "No estás autorizado." unless current_user.email == 'esteban@example.com'
    end

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end
  end
end
