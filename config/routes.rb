Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  root to: 'homes#top'
end