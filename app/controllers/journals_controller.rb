class JournalsController < ApplicationController

  def index
    @user = current_user
    @journals = User.find(current_user).journals
  end

  def new
    @user = User.find(params[:user_id])
    @journal = Journal.new
  end

  def create
    @user = User.find(params[:user_id])
    @journal = Journal.new(journal_params)
    if @journal.save
      current_user.journals << @journal
      redirect_to user_journal_path(current_user, @journal)
    end
  end

  def show
    @journal = Journal.find(params[:id])
    @entries = @journal.entries
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    @journal.update(journal_params)
    redirect_to user_journal_path(current_user, @journal)
  end

  def destroy
    @journal = Journal.find(params[:id])
    @journal.delete
    redirect_to user_journals_path(current_user), notice: "Journal successfully deleted"
  end

  private

  def journal_params
    params.require(:journal).permit(:title)
  end

end
