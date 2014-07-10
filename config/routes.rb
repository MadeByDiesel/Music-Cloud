Rails.application.routes.draw do
 

  root 'static_pages#index'

  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  resources :fans
  resources :labels
  resources :artists do
    resources :tracks
  end



  get 'sign_up', to: 'static_pages#sign_up'
  get '/artist/sign_up', to: 'artists#new'
  get '/label/sign_up', to: 'labels#new'
  get '/fan/sign_up', to: 'fans#new'

end
