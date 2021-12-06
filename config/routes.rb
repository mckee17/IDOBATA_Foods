Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'

  scope module: :public do
    resources :foods
    resources :compounds, only: [:create, :update, :destroy]
    resources :food_compounds, only: [:create, :destroy]
    resources :food_names, only: [:create, :update, :destroy]
    resources :favorites, only: [:index, :create, :destroy]
    resources :relationships, only: [:create, :destroy] do
      collection do
        get 'follow'
      end
    end
    get 'searchs', to: 'searchs#search', as: 'search'
  end

  namespace :admin do
    resources :genres, only: [:index,:edit, :create, :update]
  end
end