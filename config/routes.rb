Rails.application.routes.draw do

  scope '(:locale)' do
    root :to => 'home#index'
    get 'home/index'
  end

  #devise_for :user
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  resources :recipe_comments
  resources :recipe_scores
  resources :recipe_ingredients
  resources :recipe_tags
  resources :tags
  resources :followings
  resources :favorites
  resources :preferences
  resources :recipes
  resources :type_foods
  resources :type_dishes
  resources :ingredients
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
