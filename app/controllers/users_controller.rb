class UsersController < ApplicationController

  before_action :require_login, only: [:profile, :edit, :update, :show ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Signed up! Please log in."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_journals_path(current_user), notice: 'Information successfully updated'
  end

  def destroy
    User.delete(params[:id])
    logout
    redirect_to root_path, notice: 'Account has been deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end  
  
end
