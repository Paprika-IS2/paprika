Rails.application.routes.draw do

    namespace :api, defaults: { format: :json } do
        namespace :v1 do
            resources :users, :only => [:show, :index]
            get 'login' => 'users#login'
            resources :recipes, :only => [:show, :index]
        end
    end


  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  scope '(:locale)' do
    root :to => 'home#index'
    get 'home/index'
    get 'static_pages/aboutUs'
    resources :recipe_comments
    resources :recipe_scores
    resources :recipe_ingredients
    resources :recipe_tags
    resources :recipes
    resources :tags
    resources :followings
    resources :favorites
    resources :preferences
    resources :recipes
    resources :type_foods
    resources :type_dishes
    resources :ingredients
    resources :users
    resources :contacts, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
