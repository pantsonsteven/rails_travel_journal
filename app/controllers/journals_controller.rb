class JournalsController < ApplicationController

  def index
    @user = current_user
    @journals = User.find(current_user).journals
  end

  def show
    @journal = Journal.find(params[:id])
    @entries = @journal.entries
  end

end
