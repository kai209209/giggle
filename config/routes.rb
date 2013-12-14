Giggle::Application.routes.draw do

  get '/sign-in', to: 'sessions#new', as: :user_sign_in
  delete '/sign-out', to: 'sessions#destroy', as: :user_sign_out
  resources :sessions, only: :create

  namespace :admin do
    root 'products#index'
    resources :products do
      member do
        post :create_product_picture
      end
    end
    resources :product_pictures do
      member do
        patch :setting_cover
      end
    end
    resources :messages 
    resources :users
    resources :product_categories
    resources :evaluates do
      member do
         post :create_message
         delete :destroy_message
        end
      end
  end
 
  resources :admins
  match '/signup', to: 'admins#new', via: 'get'

  resources :products, only: [:index, :show] do
    resources :evaluates do
      member do
        post :create_message
        delete :destroy_message
        get :edit_message
        patch :update_message
      end
    end
    member do
      post :create_message
      delete :destroy_message
      get :edit_message
      patch :update_message
      get :show_messages
    end
  end
  
  resource :user do
    member do
      get :change_password
      get :change_name
      patch :update_name
      patch :update_password
    end
  end


  root 'products#index'
end
