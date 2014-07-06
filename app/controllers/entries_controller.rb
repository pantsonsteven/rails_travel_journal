class EntriesController < ApplicationController

  def new
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.new
  end

  def edit
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.find(params[:id])
  end

  def create
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.new(entry_params)
    if @entry.save
      @journal.entries << @entry
      redirect_to user_journal_path(current_user, @journal)
    end
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(entry_params)
    redirect_to user_journal_path(current_user, @journal)
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.delete
    redirect_to user_journal_path(current_user, @journal), notice: "Entry successfully deleted"
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :date, :image_url, :weather, :location, :text)
  end

end
