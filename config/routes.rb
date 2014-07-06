Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, except: [:index, :show] do 
    resources :journals do 
      resources :entries do
      end
    end
  end

  get   "logout"  => "sessions#destroy",  :as => "logout"
  get   "login"   => "sessions#new",      :as => "login"
  post  "login"   => "sessions#create"
  get   "signup"  => "users#new",         :as => "signup"
  
end
