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
    resources :food_names, only: [:show]
    resources :favorites, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy] do
      collection do
        get 'followed'
      end
    end
    get 'searchs', to: 'searchs#search', as: 'search'
  end

  namespace :admin do
    resources :genres, only: [:index,:edit, :create, :update, :destroy]
  end
end

