Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :dashboards

  authenticated :user do
    root 'dashboards#index', as: 'authenticated_root'
  end

  root 'welcome#index'

  get 'welcome/index'

end
