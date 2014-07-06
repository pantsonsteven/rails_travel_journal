class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to user_journals_path, notice: 'Login successful'
    else
      flash.now.alert = 'Email or password was invalid'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root,  notice: 'Logged out!')
  end
end
