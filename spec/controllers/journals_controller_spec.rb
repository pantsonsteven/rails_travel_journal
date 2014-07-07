require 'spec_helper'

describe JournalsController do

  # --- GIVEN A JOURNAL ---
  describe 'given a journal' do

    before :each do 
      @journal = Journal.new
      @journal.title = "France"
      @journal.save
    end

    # --- GET index
    describe 'GET index' do

      before :each do 
        get :index
      end

      it 'responds successfully' do 
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

    end # end index

    # --- GET edit
    describe 'GET edit' do 

      before :each do
        get :edit, id: @journal.id
      end

      it 'responds successfully' do 
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

    end # end GET edit

  end # --- end GIVEN A JOURNAL

end
