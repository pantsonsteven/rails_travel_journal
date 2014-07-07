require 'spec_helper'

describe UsersController do 

  # ---GIVEN A USER ---
  describe 'given a user' do 

    before :each do         
      @jim = User.new
      @jim.email = 'jim@jim.com'
      @jim.password = "password"
      @jim.password_confirmation = "password"
      @jim.remember_me_token = true
      @jim.save
    end

    # --- NEW ---
    describe 'GET new' do

      before :each do 
        get :new
      end

      it 'responds successfully' do 
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end

    end # end NEW

    # --- CREATE ---
    describe 'POST create' do 

      before :each do 
        delete :destroy, id: @jim.id
        post :create, {user: {email: 'jim@jim.com', password: 'password', password_confirmation: 'password', remember_me_token: true}}
      end

      it 'responds with a redirect' do 
        actual = response.code
        expected = '302'
        expect(actual).to eq(expected)
      end

      it 'inserts a person record' do 
        actual = User.last.email
        expected = 'jim@jim.com'
        expect(actual).to eq(expected)
      end

      it "redirects to welcome#index" do 
        expect(response).to redirect_to(root_path) 
      end

      it "renders the new template if error on create" do 
        post :create, {user: {email: 'jim@jim.com', password: 'pas'}}
        expect(response).to render_template('new')
      end

    end # end POST create

    # --- EDIT ---
    describe 'GET edit' do 

      before :each do 
        get :edit, id: @jim.id
      end

      it 'resonds successfully' do 
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)  
      end

      # it 'assigns @user' do 
      #   actual = assigns(:user)
      #   expected = @jim
      #   expect(actual).to eq(expected)
      # end


    end # end EDIT



  end # end 'given a user'

  
  
end # end describe UsersController
