class UsersController < ApplicationController

  before_action :require_login, only: [:profile, :edit, :update, :show ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root, notice: "Signed up! Please log in."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end  
end
