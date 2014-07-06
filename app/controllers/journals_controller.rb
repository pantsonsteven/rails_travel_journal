class JournalsController < ApplicationController

  def index
    @user = current_user
    @journals = User.find(current_user).journals
  end


end
