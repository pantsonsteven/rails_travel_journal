class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to user_journals_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
