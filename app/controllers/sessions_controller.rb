class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password], params[:remember_me])
    if @user
      redirect_back_or_to user_journals_path(current_user), notice: 'Login successful'
    else
      flash.now.alert = 'Email or password invalid'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path,  notice: 'Logged out!'
  end
end
