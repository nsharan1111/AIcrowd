Rails.application.routes.draw do

  namespace :admin do
    resources :users
resources :competitions
resources :datasets
resources :dataset_files
resources :hosting_institutions
resources :submissions
resources :submission_files
resources :teams
resources :team_users
resources :timelines
resources :user_competitions

    root to: "users#index"
  end

  get 'landing_page/index'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users

  resources :hosting_institutions do
    resources :competitions
    resources :users
  end

  resources :competitions do
    resources :datasets
    resources :timelines
  end

  resources :datasets do
    resources :dataset_files
  end

  resources :submissions
  resources :teams

  root to: 'landing_page#index', as: '/'

end
